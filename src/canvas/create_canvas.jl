###############################################################################
#
# Create canvas
#
###############################################################################
"""
    create_canvas(id; figsize, dpi)

Create a canvas, given
- `figsize` Given canvas size
- `dpi` Given pixels per inch
"""
function create_canvas(id; figsize=(3.5,3.5), dpi=100)
    # create a clean figure
    fig = figure(id, figsize=figsize, dpi=dpi);
    clf();

    # create axis (axes)
    axes = [];
    ax = subplot(1,1,1);
    push!(axes, ax);

    return fig,axes
end
