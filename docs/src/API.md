# PlotPlants
```@meta
CurrentModule = PlotPlants
```

## Set global font
The PyPlot package of Julia uses sans font by default, by my favorite font is
    serif type. Also, some fonts do not have normal greek letters in their
    library, like the Times only have italic greek letters. To change the
    default font to serif and use normal greek letters, the PlotPlants package
    provides a [`use_serif_tex`](@ref) function, which use LaTeX amsmath and
    upgreek packages.

```@docs
use_serif_tex
```

## Symbols and units
To facilitate the use of LaTeX packages, functions [`latex_symbol`](@ref) and
    [`latex_unit`](@ref) are provided to rapidly generate equation symbols and
    units. By default,

- if the number of letters is one, the letter will be set to italic, otherwise,
    the letters will be normal (not italic);
- if the letter is greek, the letter will be normal;
- all sub- and super-scripts are normal;

```@docs
latex_symbol
latex_unit
```

## Create canvas
An customized funtion [`create_canvas`](@ref) is provided to genrate figure and
    axes from a few keywords. For example,

- `create_canvas(fig_id)` returns a figure with one axis;
- `create_canvas(fig_id, nrow=2, ncol=2)` returns a figure will four subplots;
- `create_canvas(fig_id, nrow=2, ncol=2, ax_ind=[1,2,4])` returns a figure with
    three subplot (the left bottom panel is empty);

```@docs
create_canvas
```

## Add titles
Function [`set_titles!`](@ref) will add panel titles like `(a)` to all the
    panels, and if `labels` options is given, the labels will be added after
    the letter (e.g., `(a) label`).

```@docs
set_titles!
```

## Add regression
To quickly plot the regression lines, users may use

```@docs
plot_line_regress
```

The function will filter out the NaN from the given data, make linear
    regression using function [`line_regress`](@ref), sort the results by the
    value of x from low to high, store the results in a
    [`LinearRegressionResult`](@ref) type struct, and plot the regression line
    on the given axis. Also, if `interval` is set to `true`, the function will
    also plot the confidence intervals of the predicted y.

```@docs
line_regress
LinearRegressionResult
```
