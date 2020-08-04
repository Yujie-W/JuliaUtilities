###############################################################################
#
# Create canvas
#
###############################################################################
"""
    create_canvas(id; ncol::Int, nrow::Int, ax_ind::Array{Int,1}, figsize::Tuple{Number,Number}, dpi::Number)

Create a canvas, given
- `id` ID of the figure
- `ncol` Number of columns in the figure
- `nrow` Number of rows in the figure
- `ax_ind` Given indicies of the subplots in the figure
- `figsize` Given canvas size
- `dpi` Given pixels per inch
"""
function create_canvas(
            id;
            ncol::Int = 1,
            nrow::Int = 1,
            ax_ind::Array{Int,1} = Int[],
            figsize::Tuple{Number,Number} = (0.5+ncol*3, 0.5+nrow*3),
            dpi::Number = 100)
    # create a clean figure
    fig = figure(id, figsize=figsize, dpi=dpi);
    clf();

    # if ax_ind is empty
    if ax_ind==[]
        ax_ind = collect(1:(nrow*ncol));
    end

    # create axes
    axes = [];
    for indx in ax_ind
        ax = subplot(nrow, ncol, indx);
        push!(axes, ax);
    end

    return fig,axes
end
