module PlotPlants

using FileIO
using ImageIO
using ImageMagick

using DataFrames: DataFrame, sort!
using DocStringExtensions: TYPEDFIELDS
using GLM: @formula, adjr2, coef, coeftable, confint, lm, predict
using KernelDensity: kde, pdf
using NetcdfIO: read_nc
using ProgressMeter: @showprogress
using PyCall: PyObject, pyimport
using PyPlot: Figure, clf, figure, rc, subplot
using Random: randstring


# include the files
include("types/file_format.jl")
include("types/regression.jl" )

include("canvas/canvas.jl"  )
include("canvas/gif.jl"     )
include("canvas/titles.jl"  )
include("canvas/xylabels.jl")
include("canvas/xylims.jl"  )
include("canvas/xyticks.jl" )

include("plots/density.jl"     )
include("plots/ellipse.jl"     )
include("plots/hexbin.jl"      )
include("plots/line_regress.jl")
include("plots/preview.jl"     )
include("plots/stoma.jl"       )

include("regression/linear.jl")

include("statistics/density.jl")
include("statistics/slope.jl"  )

include("string/latex_symbol.jl")
include("string/latex_unit.jl"  )
include("string/parse_symbol.jl")
include("string/sub_super.jl"   )

include("text/font.jl"  )
include("text/render.jl")


end # module
