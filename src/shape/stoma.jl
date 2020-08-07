###############################################################################
#
# Plot stoma on axis
#
###############################################################################
"""
    plot_stoma(ax, xy::Tuple{Number,Number}; width::Number, height::Number, stoma::Number, angle::Number)

Plot a stoma on the axis, given
- `ax` Axis to plot on
- `xy` Center of the stoma
- `width` Width of the stoma
- `height` Height of the stoma
- `stoma` Stomatal pore width ratio
- `angle` Rotation angle of the stoma
"""
function plot_stoma(
            ax,
            xy::Tuple{Number,Number};
            width::Number = 10,
            height::Number = 10,
            stoma::Number = 0.2,
            angle::Number = 0
)
    patch = pyimport("matplotlib.patches");
    outl  = patch.Ellipse(xy=xy,
                          width=width,
                          height=height,
                          color="green",
                          angle=angle,
                          clip_on=false);
    pore  = patch.Ellipse(xy=xy,
                          width=width*stoma,
                          height=height*0.9,
                          color="white",
                          angle=angle,
                          clip_on=false);
    ax.add_artist(outl);
    ax.add_artist(pore);

    return nothing
end
