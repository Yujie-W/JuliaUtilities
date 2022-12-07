#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2022-Dec-07: refactor the function to canvas
#
#######################################################################################################################################################################################################
"""

    canvas(id::Union{Int,String}; axids::Union{Nothing,Vector{Int}} = nothing, dpi::Int = 100, ncol::Int = 1, nrow::Int = 1, figsize::Tuple = (0.5 + ncol * 3, 0.5 + nrow * 3))

Create the canvas, given
- `id` ID of the figure
- `axids` Given indicies of the subplots in the figure (default is nothing)
- `ncol` Number of columns in the figure (default is 1)
- `nrow` Number of rows in the figure (default is 1)
- `figsize` Given canvas size (default is 0.5 + 3 * ncol [width] and 0.5 + 3 * nrow [height])
- `dpi` Given pixels per inch (default is 100)

"""
function canvas(id::Union{Int,String}; axids::Union{Nothing,Vector{Int}} = nothing, dpi::Int = 100, ncol::Int = 1, nrow::Int = 1, figsize::Tuple = (0.5 + ncol * 3, 0.5 + nrow * 3))
    # create a clean figure
    _fig = figure(id, figsize = figsize, dpi = dpi);
    _fig.clear();

    # if axids is empty
    _axids = isnothing(axids) ? collect(1:nrow*ncol) : axids;

    # add axes
    _axes = [];
    for _id in _axids
        push!(_fig.add_subplot(nrow, ncol, _id));
    end;

    return _fig
end
