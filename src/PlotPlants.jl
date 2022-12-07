module PlotPlants

using FileIO
using ImageIO
using ImageMagick

using DataFrames: DataFrame, sort!
using DocStringExtensions: TYPEDFIELDS
using KernelDensity: kde, pdf
using ProgressMeter: @showprogress
using PyCall: PyObject, pyimport
using PyPlot: Figure, clf, figure, rc, subplot
using Random: randstring

using ..EmeraldRegression: linear_regress
using ..NetcdfIO: read_nc


# include the files
include("../packages/PlotPlants.jl/src/canvas.jl"    )
include("../packages/PlotPlants.jl/src/decoration.jl")


include("../packages/PlotPlants.jl/src/types/file_format.jl")
include("../packages/PlotPlants.jl/src/types/regression.jl" )

include("../packages/PlotPlants.jl/src/canvas/gif.jl"     )
include("../packages/PlotPlants.jl/src/canvas/xylabels.jl")

include("../packages/PlotPlants.jl/src/plots/density.jl"     )
include("../packages/PlotPlants.jl/src/plots/ellipse.jl"     )
include("../packages/PlotPlants.jl/src/plots/hexbin.jl"      )
include("../packages/PlotPlants.jl/src/plots/line_regress.jl")
include("../packages/PlotPlants.jl/src/plots/preview.jl"     )
include("../packages/PlotPlants.jl/src/plots/stoma.jl"       )

include("../packages/PlotPlants.jl/src/statistics/density.jl")

include("../packages/PlotPlants.jl/src/string/latex_symbol.jl")
include("../packages/PlotPlants.jl/src/string/latex_unit.jl"  )
include("../packages/PlotPlants.jl/src/string/parse_symbol.jl")
include("../packages/PlotPlants.jl/src/string/sub_super.jl"   )

include("../packages/PlotPlants.jl/src/text/font.jl"  )
include("../packages/PlotPlants.jl/src/text/render.jl")


end # module
