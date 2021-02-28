###############################################################################
#
# Make hexbin plot
#
###############################################################################
"""
    plot_hexbin!(
                ax::PyObject,
                xs::Array,
                ys::Array;
                cmap::String = "Greys",
                logbins::Bool = false,
                gridsize::Number = 25
    )
    plot_hexbin!(
                ax::PyObject,
                xs::Array,
                ys::Array,
                xlims::Array,
                ylims::Array;
                cmap::String = "Greys",
                logbins::Bool = false,
                gridsize::Number = 25
    )

Plot density plot on axis, given
- `ax` Axis to plot on
- `xs` Array of X
- `ys` Array of Y
- `cmap` Optional. Color map scheme
- `logbins` Optional. If true, use log(count) to color the bins
- `gridsize` Number of bins on both directions
- `xlim` Limits of x axis. Used to make plot region equal among subplots
- `ylim` Limits of y axis. Used to make plot region equal among subplots
"""
function plot_hexbin!(
            ax::PyObject,
            xs::Array,
            ys::Array;
            cmap::String = "Greys",
            logbins::Bool = false,
            gridsize::Number = 25
)
    if logbins
        ax.hexbin(xs, ys; cmap=cmap, bins="log", gridsize=gridsize);
    else
        ax.hexbin(xs, ys; cmap=cmap, gridsize=gridsize);
    end

    return nothing
end




function plot_hexbin!(
            ax::PyObject,
            xs::Array,
            ys::Array,
            xlims::Array,
            ylims::Array;
            cmap::String = "Greys",
            logbins::Bool = false,
            gridsize::Number = 25
)
    newxs = [collect(xs);
             xlims[1] - (xlims[2]-xlims[1]) / 10;
             xlims[2] + (xlims[2]-xlims[1]) / 10];
    newys = [collect(ys);
             ylims[1] - (ylims[2]-ylims[1]) / 10;
             ylims[2] + (ylims[2]-ylims[1]) / 10];
    plot_hexbin!(ax, newxs, newys; cmap=cmap, logbins=logbins,
                 gridsize=gridsize);

    return nothing
end
