#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2022-Nov-14: refactor the function
#     2022-Nov-14: use EmeraldRegression function (and remove option intercept)
#
#######################################################################################################################################################################################################
"""

    plot_density!(ax::PyObject, xs::Vector, ys::Vector; cmap::String = "viridis", dmax::Union{Nothing, Number} = nothing, markersize::Number = 8)

Plot the scatter plot colored by the density of dots, given
- `ax` PyPlot Axis to plot on
- `xs` Vector of X
- `ys` Vector of Y
- `cmap` Color map scheme
- `dmax` Maximum density in the color scheme
- `markersize` Marker size (use the square value when plotting)

"""
function plot_density!(ax::PyObject, xs::Vector, ys::Vector; cmap::String = "viridis", dmax::Union{Nothing, Number} = nothing, markersize::Number = 8)
    # prepare dataframe
    _mask = (.!isnan.(xs)) .&& (.!isnan.(ys));
    _varx = xs[_mask];
    _vary = ys[_mask];
    _varc = similar(_varx);

    _ik = kde((_varx, _vary));
    if length(_varx) > 1000
        @showprogress for i in eachindex(_varx)
            _varc[i] = pdf(_ik, _varx[i], _vary[i]);
        end
    else
        _varc .= pdf.([_ik], _varx, _vary);
    end
    df = DataFrame(X = _varx, Y = _vary, C = _varc);
    sort!(df, [:C]);

    # set a max density limit for the data
    _c = isnothing(dmax) ? df.C : min.(df.C, dmax);
    ax.scatter(df.X, df.Y, s = markersize^2, c = _c, cmap = cmap);

    return nothing
end


#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2022-Nov-14: refactor the function
#     2022-Nov-14: use EmeraldRegression function (and remove option intercept)
#
#######################################################################################################################################################################################################
"""

    plot_line_regress!(ax::PyObject, xs::Tuple, ys::Vector; linestyle::String = "-", interval::Bool = false, color::String = "red", alpha::Number = 0.3)

Plor linear regression and confidence interval on the axis, given
- `ax` Given axis
- `xs` Tuple of x
- `ys` Vector of y
- `linestyle` Optional. Line style for the regression curve ("-" by default)
- `interval` Optional: if true, plot the confidence interval of fitted y
- `color` Color the fitted curve
- `alpha` Transparency of the confidence interval (same color as curve)

"""
function plot_line_regress!(ax::PyObject, xs::Tuple, ys::Vector; linestyle::String = "-", interval::Bool = false, color::String = "red", alpha::Number = 0.3)
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
