module EmeraldVisualization

using Plots

using DocStringExtensions: TYPEDEF, TYPEDFIELDS
using Plots: Plot, Subplot

using ..NetcdfIO: read_nc


include("../packages/EmeraldVisualization.jl/src/animation.jl")
include("../packages/EmeraldVisualization.jl/src/styles.jl"   )

include("../packages/EmeraldVisualization.jl/src/netcdf.jl")


end # module EmeraldVisualization
