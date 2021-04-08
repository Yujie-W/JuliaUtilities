module ConstrainedRootSolvers

using DocStringExtensions: METHODLIST, TYPEDEF, TYPEDFIELDS
using UnPack: @unpack




# export public Types
export BisectionMethod, NelderMeadMethod, NewtonBisectionMethod,
       NewtonRaphsonMethod, ReduceStepMethod, ReduceStepMethodND,
       ResidualTolerance, SolutionTolerance, SolutionToleranceND

# export public functions
export find_peak, find_zero




include("method.jl"   )
include("tolerance.jl")

include("findpeak/bisection.jl"   )
include("findpeak/neldermead.jl"  )
include("findpeak/reducestep.jl"  )
include("findpeak/reducestepND.jl")

include("findzero/bisection.jl"      )
include("findzero/newtonbisection.jl")
include("findzero/newtonraphson.jl"  )
include("findzero/reducestep.jl"     )




end # module
