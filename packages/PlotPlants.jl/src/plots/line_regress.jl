#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2022-Nov-14: refactor the function
#     2022-Nov-14: use EmeraldRegression function (and remove option intercept)
#
#######################################################################################################################################################################################################
"""

    plot_line_regress!(ax::PyObject, xs::Tuple, ys::Array; linestyle::String = "-", interval::Bool = false, color::String = "red", alpha::Number = 0.3)

Plor linear regression and confidence interval on the axis, given
- `ax` Given axis
- `xs` Tuple of x
- `ys` Array of y
- `linestyle` Optional. Line style for the regression curve ("-" by default)
- `interval` Optional: if true, plot the confidence interval of fitted y
- `color` Color the fitted curve
- `alpha` Transparency of the confidence interval (same color as curve)

"""
function plot_line_regress!(ax::PyObject, xs::Tuple, ys::Array; linestyle::String = "-", interval::Bool = false, color::String = "red", alpha::Number = 0.3)
    # make linear regression
    lr = linear_regress(xs, ys);
    df = sort(lr.XY);

    # plot the fittings
    ax.plot(df.X1, df.predY; linestyle = linestyle, color = color);
    if interval
        ax.fill_between(df.X1, df.lowerY, df.upperY; facecolor = color, alpha = alpha);
    end

    return nothing
end
