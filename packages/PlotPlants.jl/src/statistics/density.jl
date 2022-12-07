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
