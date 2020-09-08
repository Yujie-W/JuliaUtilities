module PlotPlants

using DataFrames
using DocStringExtensions
using GLM
using PyCall
using PyPlot
using Revise
using Statistics




# export public functions
export create_canvas,
       latex_symbol,
       latex_unit,
       line_regress,
       line_regress_test_slope,
       mae,
       mape,
       nanmean,
       nanstd,
       plot_line_regress,
       use_serif_tex

# export functions to plot shapes
export plot_ellipse,
       plot_stoma

# export functions that iterate throught array of axis
export set_titles!,
       set_xlabels!,
       set_xlims!,
       set_xticklabels!,
       set_xticks!,
       set_xylabels!,
       set_xylims!,
       set_xyticklabels!,
       set_xyticks!,
       set_ylabels!,
       set_ylims!,
       set_yticklabels!,
       set_yticks!




# include the files
include("canvas/create_canvas.jl")
include("canvas/titles.jl"       )
include("canvas/xylabels.jl"     )
include("canvas/xylims.jl"       )
include("canvas/xyticks.jl"      )

include("fitting/line_regress.jl")

include("font/serif_tex.jl")

include("shape/ellipse.jl")
include("shape/stoma.jl"  )

include("statistics/line_regress.jl")
include("statistics/mae.jl"         )

include("string/symbols.jl")
include("string/units.jl"  )




end # module
