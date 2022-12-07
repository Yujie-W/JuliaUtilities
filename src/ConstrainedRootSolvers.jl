module ConstrainedRootSolvers

using DocStringExtensions: METHODLIST, TYPEDEF, TYPEDFIELDS


include("../packages/ConstrainedRootSolvers.jl/src/method.jl"   )
include("../packages/ConstrainedRootSolvers.jl/src/tolerance.jl")
include("../packages/ConstrainedRootSolvers.jl/src/find_peak.jl")
include("../packages/ConstrainedRootSolvers.jl/src/find_zero.jl")

include("../packages/ConstrainedRootSolvers.jl/src/findpeak/neldermead.jl"  )
include("../packages/ConstrainedRootSolvers.jl/src/findpeak/reducestep.jl"  )
include("../packages/ConstrainedRootSolvers.jl/src/findpeak/reducestepND.jl")


end # module
