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








###############################################################################
#
# Make density plot
#
###############################################################################
"""
    plot_density(
                ax,
                xs::Array,
                ys::Array;
                cmap::String="viridis",
                markersize::Number=8)
    plot_density(
                ax,
                df::DataFrame;
                cmap::String="viridis",
                markersize::Number=8)

Plot density plot on axis, given
- `ax` Axis to plot on
- `xs` Array of X
- `ys` Array of Y
- `cmap` Optional. Color map scheme
- `markersize` Optional. Marker size dimension, scatter size is markersize^2
- `dmax` Maximal density. If `dmax` is not NaN, use dmax as maximum density
- `df` A dataframe with column names of ("X","Y","C")
"""
function plot_density(
            ax,
            xs::Array,
            ys::Array;
            cmap::String="viridis",
            markersize::Number=8,
            dmax::Number=NaN
)
    df = calculate_density(xs, ys);
    plot_density(ax, df; cmap=cmap, markersize=markersize, dmax=dmax);

    return nothing
end




function plot_density(
            ax,
            df::DataFrame;
            cmap::String="viridis",
            markersize::Number=8,
            dmax::Number=NaN
)
    # plot the scatter on axis, if cmax is not NaN, use cmax
    cc = (isnan(dmax) ? (df).C : min.((df).C, dmax));
    ax.scatter((df).X, (df).Y, s=markersize^2, c=cc, cmap=cmap);

    return nothing
end
