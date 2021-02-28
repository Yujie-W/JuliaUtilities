###############################################################################
#
# Create canvas
#
###############################################################################
"""
    create_canvas(
                id::Union{Int,String};
                ncol::Int = 1,
                nrow::Int = 1,
                axids::Array{Int,1} = Int[],
                figsize::Tuple{Number,Number} = (0.5+ncol*3, 0.5+nrow*3),
                dpi::Number = 100
    )

Create a canvas, given
- `id` ID of the figure
- `ncol` Number of columns in the figure
- `nrow` Number of rows in the figure
- `axids` Given indicies of the subplots in the figure
- `figsize` Given canvas size
- `dpi` Given pixels per inch
"""
function create_canvas(
            id::Union{Int,String};
            ncol::Int = 1,
            nrow::Int = 1,
            axids::Array{Int,1} = Int[],
            figsize::Tuple{Number,Number} = (0.5+ncol*3, 0.5+nrow*3),
            dpi::Number = 100
)
    # create a clean figure
    fig = figure(id, figsize=figsize, dpi=dpi);
    clf();

    # if axids is empty
    if axids==[]
        axids = collect(1:(nrow*ncol));
    end

    # create axes
    axs = [];
    for indx in axids
        ax = subplot(nrow, ncol, indx);
        push!(axs, ax);
    end

    return fig,axs
end








###############################################################################
#
# Save canvas
#
###############################################################################
"""
    save_canvas!(fig::Figure, path::String, saving::Bool = false)

Save a canvas, given
- `fig` Canvas to save
- `path` Path to save the figure
- `saving` Optional. If true, save the figure
"""
function save_canvas!(fig::Figure, path::String, saving::Bool = false)
    fig.set_tight_layout(true);
    if saving
        fig.savefig(path, bbox_inches="tight");
    end

    return nothing
end
