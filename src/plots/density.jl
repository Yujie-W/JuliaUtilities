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
                cmap::String,
                markersize::Number,
                dmax::Number)
    plot_density(
                ax,
                df::DataFrame;
                cmap::String,
                markersize::Number
                dmax::Number)

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
