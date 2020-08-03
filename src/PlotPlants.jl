module PlotPlants

using PyPlot
using Revise




# export public functions
export create_canvas,
       latex_symbol,
       use_serif_tex




# include the files
include("canvas/create_canvas.jl")

include("font/serif_tex.jl")

include("statistics/line_regress.jl")

include("string/symbols.jl")
include("string/units.jl"  )




end # module
