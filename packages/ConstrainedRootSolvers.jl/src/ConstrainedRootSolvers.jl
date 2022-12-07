module ConstrainedRootSolvers

using DocStringExtensions: METHODLIST, TYPEDEF, TYPEDFIELDS


include("method.jl"   )
include("tolerance.jl")
include("find_peak.jl")
include("find_zero.jl")

include("findpeak/neldermead.jl"  )
include("findpeak/reducestep.jl"  )
include("findpeak/reducestepND.jl")


end # module
