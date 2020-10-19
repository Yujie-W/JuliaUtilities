###############################################################################
#
# Plot density plot
#
###############################################################################
"""
    plot_density(ax,
                 xs::Array,
                 ys::Array;
                 cmap::String="viridis",
                 markersize::Number=8)

Plot density plot on axis, given
- `ax` Axis to plot on
- `xs` Array of X
- `ys` Array of Y
- `cmap` Optional. Color map scheme
- `markersize` Optional. Marker size dimension, scatter size is markersize^2
"""
function plot_density(
            ax,
            xs::Array,
            ys::Array;
            cmap::String="viridis",
            markersize::Number=8
)
    # calculate the kernel density and sort the density of each data point
    ik = kde((xs,ys));
    cs = similar(xs);
    if length(xs) > 1000
        @showprogress for i in eachindex(xs)
            cs[i] = pdf(ik, xs[i], ys[i]);
        end
    end
    df = DataFrame(X=xs, Y=ys, C=cs);
    sort!(df, [:C]);

    # plot the scatter on axis
    ax.scatter((df).X, (df).Y, s=markersize^2, c= (df).C, cmap=cmap);

    return nothing
end
