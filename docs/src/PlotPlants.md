# PlotPlants

```@meta
CurrentModule = PlotPlants
```


## Usage
```julia
using PlotPlants

# use all the functions in the project
use_serif_tex();
fig,axs = create_canvas("1"; ncol=2, nrow=2, axids=[1,3,4]);
set_titles!(axs);
```


## Set global font

The PyPlot package of Julia uses sans font by default, by my favorite font is
    serif type. Also, some fonts do not have normal greek letters in their
    library, like the Times only have italic greek letters. To change the
    default font to serif and use normal greek letters, the PlotPlants package
    provides a [`use_serif_tex`](@ref) function, which use LaTeX amsmath and
    upgreek packages. Also, sans-serif font and normal text render are also
    supported.

```@docs
use_sans
use_sans_tex
use_sans_text
use_serif
use_serif_tex
use_serif_text
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
parse_symbol
subscript
superscript
```

## Create and save canvas

An customized funtion [`create_canvas`](@ref) is provided to genrate figure and
    an array of axis from a few keywords. For example,

- `create_canvas(fig_id)` returns a figure with one axis;
- `create_canvas(fig_id, nrow=2, ncol=2)` returns a figure will four subplots;
- `create_canvas(fig_id, nrow=2, ncol=2, axs=[1,2,4])` returns a figure with
    three subplot (the left bottom panel is empty);

```@docs
create_canvas
save_canvas!
save_gif!
```

## Shapes

A few customized shapes can be added to the canvas very conveniently, for
    example, stoma and ellipse. These shortcut functions include

```@docs
plot_ellipse!
plot_stoma!
```

## Set titles, lims, ticks, and ticklabels

Function [`set_titles!`](@ref) will add panel titles like `(a)` to all the
    panels, and if `labels` options is given, the labels will be added after
    the letter (e.g., `(a) label`).

```@docs
set_titles!
```

Similarly, the package provides shortcuts to set the X-axis and Y-axis labels,
    limits, ticks, and tick labels.

```@docs
set_xlabels!
set_ylabels!
set_xylabels!
set_xlims!
set_ylims!
set_xylims!
set_xticks!
set_yticks!
set_xyticks!
set_xticklabels!
set_yticklabels!
set_xyticklabels!
```

## Add regression

To quickly plot the regression lines, users may use

```@docs
plot_line_regress!
```

The function will filter out the NaN from the given data, make linear
    regression using function [`line_regress`](@ref), sort the results by the
    value of x from low to high, store the results in a
    [`LinearRegressionResult`](@ref) type struct, and plot the regression line
    on the given axis. Also, if `interval` is set to `true`, the function will
    also plot the confidence intervals of the predicted y.

```@docs
linear_df_xy
line_regress
LinearRegressionResult
```

Further, the PlotPlants module provides a quick tool to test whether the slope
    differs from a given value, see

```@docs
test_slope
```

## Density plot

```@docs
calculate_density
plot_density!
plot_hexbin!
```

## Preview dataset

```@docs
preview_data
preview_dataset!
AbstractFormat
FormatNC
FormatTIFF
```
