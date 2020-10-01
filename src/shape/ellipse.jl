###############################################################################
#
# Plot ellipse on axis
#
###############################################################################
"""
    plot_ellipse(ax,
                 xy::Tuple{Number,Number};
                 width::Number,
                 height::Number,
                 angle::Number,
                 color::String,
                 edgecolor::String,
                 facecolor::String,
                 alpha::Number)

Plot an ellipse on axis, given
- `ax` Axis to plot on
- `xy` Center of the ellipse
- `width` Width of the ellipse
- `height` Height of the ellipse
- `angle` Rotation angle of the ellipse
- `color` Color of the ellipse
- `edgecolor` Edgecolor of the ellipse
- `facecolor` Face color of the ellipse
- `alpha` Transparency of the ellipse
"""
function plot_ellipse(
            ax,
            xy::Tuple{Number,Number};
            width::Number = 10,
            height::Number = 10,
            angle::Number = 0,
            color::String = "black",
            edgecolor::String = color,
            facecolor::String = color,
            alpha::Number = 0.5
)
    patch = pyimport("matplotlib.patches");
    outl  = patch.Ellipse(xy=xy,
                          width=width,
                          height=height,
                          edgecolor=edgecolor,
                          facecolor=facecolor,
                          angle=angle,
                          clip_on=false,
                          alpha=alpha);
    ax.add_artist(outl);

    return nothing
end
