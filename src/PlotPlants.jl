module PlotPlants

using DataFrames
using DocStringExtensions
using GLM
using PyPlot
using Revise




# export public functions
export create_canvas,
       latex_symbol,
       latex_unit,
       line_regress,
       plot_line_regress,
       use_serif_tex




# include the files
include("canvas/create_canvas.jl")
include("canvas/line_regress.jl" )
include("canvas/title.jl"        )

include("font/serif_tex.jl")

include("statistics/line_regress.jl")

include("string/symbols.jl")
include("string/units.jl"  )




end # module
