module PlotPlants

using DataFrames: DataFrame, sort!
using DocStringExtensions: TYPEDFIELDS
using KernelDensity: kde, pdf
using ProgressMeter: @showprogress
using PyCall: PyObject, pyimport
using PyPlot: Figure, clf, figure, rc, subplot
using Random: randstring

using ..EmeraldRegression: linear_regress
using ..NetcdfIO: read_nc


PATCHES = pyimport("matplotlib.patches");


# include the files
include("../packages/PlotPlants.jl/src/canvas.jl"    )
include("../packages/PlotPlants.jl/src/decoration.jl")
include("../packages/PlotPlants.jl/src/latex.jl"     )
include("../packages/PlotPlants.jl/src/scientific.jl")
include("../packages/PlotPlants.jl/src/shapes.jl"    )


end # module
