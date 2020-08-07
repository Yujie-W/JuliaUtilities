module PlotPlants

using DataFrames
using DocStringExtensions
using GLM
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
       set_titles!,
       use_serif_tex




# include the files
include("canvas/create_canvas.jl")
include("canvas/line_regress.jl" )
include("canvas/title.jl"        )

include("font/serif_tex.jl")

include("statistics/line_regress.jl")
include("statistics/mae.jl"         )

include("string/symbols.jl")
include("string/units.jl"  )




end # module
