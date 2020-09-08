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
       plot_ellipse,
       plot_line_regress,
       plot_stoma,
       set_titles!,
       set_xlabels!,
       set_xylabels!,
       set_ylabels!,
       use_serif_tex




# include the files
include("canvas/create_canvas.jl")
include("canvas/title_label.jl"  )

include("fitting/line_regress.jl")

include("font/serif_tex.jl")

include("shape/ellipse.jl")
include("shape/stoma.jl"  )

include("statistics/line_regress.jl")
include("statistics/mae.jl"         )

include("string/symbols.jl")
include("string/units.jl"  )




end # module
