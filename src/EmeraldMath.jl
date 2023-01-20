module EmeraldMath

using Statistics: mean, median, std
using StatsBase: percentile


include("../packages/EmeraldMath.jl/src/integral.jl"  )
include("../packages/EmeraldMath.jl/src/quadratic.jl" )
include("../packages/EmeraldMath.jl/src/statistics.jl")


end # module
