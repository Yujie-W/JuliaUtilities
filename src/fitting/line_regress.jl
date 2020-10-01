###############################################################################
#
# Plot linear regression on axis
#
###############################################################################
"""
    plot_line_regress(ax,
                      list_x::Array,
                      list_y::Array;
                      intercept::Bool,
                      interval::Bool,
                      color::String,
                      alpha::Number)

Plor linear regression and confidence interval on the axis, given
- `ax` Given axis
- `list_x` Array of x
- `list_y` Array of y
- `intercept` Optional: if true, fit the data with an intercept
- `interval` Optional: if true, plot the confidence interval of fitted y
- `color` Color the fitted curve
- `alpha` Transparency of the confidence interval (same color as curve)
"""
function plot_line_regress(
            ax,
            list_x::Array,
            list_y::Array;
            intercept::Bool = true,
            interval::Bool = false,
            color::String = "red",
            alpha::Number = 0.3
)
    # make linear regression
    lr = line_regress(list_x, list_y, intercept=intercept, sorting=true);

    # plot the fittings
    ax.plot(lr.df.X, lr.df.predY, color=color);
    if interval
        ax.fill_between(lr.df.X,
                        lr.df.lowerY,
                        lr.df.upperY,
                        facecolor=color,
                        alpha=alpha);
    end

    return nothing
end
