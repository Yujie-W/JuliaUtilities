###############################################################################
#
# Generate density plot dataframe
#
###############################################################################
"""
    calculate_density(xs::Array, ys::Array)

Plot density plot on axis, given
- `xs` Array of X
- `ys` Array of Y
"""
function calculate_density(xs::Array, ys::Array)
    mask = (.!isnan.(xs)) .* (.!isnan.(ys));
    xx   = xs[mask];
    yy   = ys[mask];
    # calculate the kernel density and sort the density of each data point
    ik = kde((xx,yy));
    cc = similar(xx);
    if length(xx) > 1000
        @showprogress for i in eachindex(xx)
            cc[i] = pdf(ik, xx[i], yy[i]);
        end
    else
        cc .= pdf.([ik], xx, yy);
    end
    df = DataFrame(X=xx, Y=yy, C=cc);
    sort!(df, [:C]);

    return df
end




function calculate_density(xs::Array, ys::Array, nthread::Number)
    # add workers
    if length(workers()) < nthread
        addprocs(nthread - length(workers()), exeflags="--project");
    end
    @everywhere Base.MainInclude.eval(using PlotPlants);

    # filter out NaN
    mask = (.!isnan.(xs)) .* (.!isnan.(ys));
    xx   = xs[mask];
    yy   = ys[mask];

    # calculate the kernel density and sort the density of each data point
    ik     = kde((xx,yy));
    params = [];
    for i in eachindex(xx)
        push!(params, [xx[i], yy[i]]);
    end

    # function to run in threads
    @inline pdf_thread(param) = return pdf(ik, param[1], param[2]);

    if length(xx) > 1000
        cc = @showprogress pmap(pdf_thread, params);
    else
        cc = pmap(pdf_thread, params);
    end

    # create and sort dataframe
    df = DataFrame(X=xx, Y=yy, C=cc);
    sort!(df, [:C]);

    return df
end
