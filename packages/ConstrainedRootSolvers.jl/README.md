# ConstrainedRootSolvers.jl

Common algorithms for root finding often do not work for plants because of the wierd shape of curves. In many cases, chosing a good initial guess works. But in many case, the initial guess may result in error. Here, customized root finding algorithms are presented with constaints. Due to the dependency on `PkgUtility`, [`ConstrainedRootSolvers.jl`][rs-url] only spports Julia 1.6 and above.
