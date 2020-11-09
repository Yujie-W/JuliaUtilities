# # Canvas




# ## Initialization
using PlotPlants
#------------------------------------------------------------------------------




# ## Create canvas
# ### Default 1×1 figure (default)
_fig,_axes = create_canvas("1X1 figure");
_fig
#------------------------------------------------------------------------------

# ### M×N figure
_fig,_axes = create_canvas("M×N figure"; nrow=2, ncol=3);
_fig
#------------------------------------------------------------------------------

# ### Leave some panels empty
## this will omit the fifth panel (2nd row, 2nd column)
_fig,_axes = create_canvas("Omit panels"; nrow=2, ncol=3, axids=[1,2,3,4,6]);
_fig
#------------------------------------------------------------------------------

# ### Change figure size
_fig,_axes = create_canvas("Figure size"; nrow=2, ncol=3, figsize=(6,4));
_fig
#------------------------------------------------------------------------------

# ### Change figure resolution
_fig,_axes = create_canvas("Figure resolution"; nrow=2, ncol=3, dpi=50);
_fig
#------------------------------------------------------------------------------




# ## Panel titles
# ### Default
# Note that by default, `set_titles!` uses latex render, and thus the titles
#     are in a format like `\\textbf{(a)}`. In this way, the title can be
#     cutomized easily if one wants bold label and normal extra label. Also,
#     remember to enable latex render. If `usetex` option is `false`, titles
#     will be bold using the `fontweight` option in `matplotlib`.
_fig,_axes = create_canvas("Panel titles"; nrow=2, ncol=3);
set_titles!(_axes; usetex=false);
_fig
#------------------------------------------------------------------------------

# ### Add extra labels
_fig,_axes = create_canvas("Extra labels"; nrow=2, ncol=3);
set_titles!(_axes; labels=["extra label" for i in 1:6], usetex=false);
_fig
#------------------------------------------------------------------------------

# ### Remove label parenthesis
_fig,_axes = create_canvas("No parenthesis"; nrow=2, ncol=3);
set_titles!(_axes; paren=false, usetex=false);
_fig
#------------------------------------------------------------------------------

# ### Capital labels
_fig,_axes = create_canvas("Capital labels"; nrow=2, ncol=3);
set_titles!(_axes; capital=true, usetex=false);
_fig
#------------------------------------------------------------------------------

# ### Dot after labels
_fig,_axes = create_canvas("Dot after labels"; nrow=2, ncol=3);
set_titles!(_axes; paren=false, dotsep=true, usetex=false);
_fig
#------------------------------------------------------------------------------

# ### Set title fontsize
_fig,_axes = create_canvas("Title font size"; nrow=2, ncol=3);
set_titles!(_axes; fontsize=24, usetex=false);
_fig
#------------------------------------------------------------------------------

# ### Set title location
_fig,_axes = create_canvas("Title location"; nrow=2, ncol=3);
set_titles!(_axes; loc="left", usetex=false);
_fig
#------------------------------------------------------------------------------




# ## Axis labels
# ### Add X-axis labels
_fig,_axes = create_canvas("X axis labels"; nrow=2, ncol=3);
set_xlabels!(_axes, ["X label" for i in 1:6]);
_fig
#------------------------------------------------------------------------------

# ### Change X-axis label fontsize
_fig,_axes = create_canvas("X axis label fontsize"; nrow=2, ncol=3);
set_xlabels!(_axes, ["X label" for i in 1:6]; fontsize=12);
_fig
#------------------------------------------------------------------------------

# ### Add Y-axis labels
_fig,_axes = create_canvas("Y axis labels"; nrow=2, ncol=3);
set_ylabels!(_axes, ["Y label" for i in 1:6]);
_fig
#------------------------------------------------------------------------------

# ### Change Y-axis label fontsize
_fig,_axes = create_canvas("Y axis label fontsize"; nrow=2, ncol=3);
set_ylabels!(_axes, ["Y label" for i in 1:6]; fontsize=12);
_fig
#------------------------------------------------------------------------------

# ### Add both X and Y axis labels
_fig,_axes = create_canvas("X and Y axis"; nrow=2, ncol=3);
set_xylabels!(_axes, ["X label" for i in 1:6],
                     ["Y label" for i in 1:6]; fontsize=12);
_fig
#------------------------------------------------------------------------------




# ## Axis limits
# ### Set X-axis limits
_fig,_axes = create_canvas("X limits"; nrow=2, ncol=3);
set_xlims!(_axes, [[-1,1] for i in 1:6]);
_fig
#------------------------------------------------------------------------------

# ### Set Y-axis limits
_fig,_axes = create_canvas("Y limits"; nrow=2, ncol=3);
set_ylims!(_axes, [[-1,1] for i in 1:6]);
_fig
#------------------------------------------------------------------------------

# ### Set both X and Y axis limits
_fig,_axes = create_canvas("X and Y limits"; nrow=2, ncol=3);
set_xylims!(_axes, [[-1,1] for i in 1:6], [[-1,1] for i in 1:6]);
_fig
#------------------------------------------------------------------------------




# ## Axis ticks and ticklabels
# ### Set X-axis ticks and ticklabels
_fig,_axes = create_canvas("X ticks"; nrow=2, ncol=3);
set_xticks!(_axes, [[-1,0,1] for i in 1:6]);
set_xticklabels!(_axes, [["A","B","C"] for i in 1:6]);
_fig
#------------------------------------------------------------------------------

# ### Set Y-axis ticks and ticklabels
_fig,_axes = create_canvas("Y ticks"; nrow=2, ncol=3);
set_yticks!(_axes, [[-1,0,1] for i in 1:6]);
set_yticklabels!(_axes, [["D","E","F"] for i in 1:6]);
_fig
#------------------------------------------------------------------------------

# ### Set Both X and Y axis ticks and ticklabels
_fig,_axes = create_canvas("X and Y ticks"; nrow=2, ncol=3);
set_xyticks!(_axes, [[-1,0,1] for i in 1:6], [[-1,0,1] for i in 1:6]);
set_xyticklabels!(_axes, [["A","B","C"] for i in 1:6],
                         [["D","E","F"] for i in 1:6]);
_fig
#------------------------------------------------------------------------------




# ## Set tight layout
_fig,_axes = create_canvas("Tight layout"; nrow=2, ncol=3);
set_titles!(_axes; loc="left", usetex=false);
set_xylabels!(_axes, ["X label" for i in 1:6],
                     ["Y label" for i in 1:6]; fontsize=12);
set_xyticks!(_axes, [[-1,0,1] for i in 1:6], [[-1,0,1] for i in 1:6]);
set_xyticklabels!(_axes, [["A","B","C"] for i in 1:6],
                         [["D","E","F"] for i in 1:6]);
_fig.set_tight_layout(true);
_fig
#------------------------------------------------------------------------------
