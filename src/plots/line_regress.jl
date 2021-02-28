###############################################################################
#
# Plot linear regression on axis
#
###############################################################################
"""
    plot_line_regress!(
                ax::PyObject,
                xs::Array,
                ys::Array;
                linestyle::String = "-",
                intercept::Bool = true,
                interval::Bool = false,
                color::String = "red",
                alpha::Number = 0.3
    )

Plor linear regression and confidence interval on the axis, given
- `ax` Given axis
- `xs` Array of x
- `ys` Array of y
- `linestyle` Optional. Line style for the regression curve ("-" by default)
- `intercept` Optional: if true, fit the data with an intercept
- `interval` Optional: if true, plot the confidence interval of fitted y
- `color` Color the fitted curve
- `alpha` Transparency of the confidence interval (same color as curve)
"""
function plot_line_regress!(
            ax::PyObject,
            xs::Array,
            ys::Array;
            linestyle::String = "-",
            intercept::Bool = true,
            interval::Bool = false,
            color::String = "red",
            alpha::Number = 0.3
)
    # make linear regression
    lr = line_regress(xs, ys, intercept=intercept, sorting=true);

    # plot the fittings
    ax.plot(lr.df.X, lr.df.predY, linestyle=linestyle, color=color);
    if interval
        ax.fill_between(lr.df.X,
                        lr.df.lowerY,
                        lr.df.upperY,
                        facecolor=color,
                        alpha=alpha);
    end

    return nothing
end
