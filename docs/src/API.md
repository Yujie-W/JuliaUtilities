# API
```@meta
CurrentModule = ConstrainedRootSolvers
```

## Numerical methods

### Find zero
```@docs
find_zero
find_zero(f::Function, ms::BisectionMethod{FT},
    tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}}; stepping::Bool =
    false) where {FT<:AbstractFloat}
find_zero(f::Function, ms::NewtonBisectionMethod{FT},
    tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}}; stepping::Bool =
    false) where {FT<:AbstractFloat}
find_zero(f::Function, ms::NewtonRaphsonMethod{FT},
    tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}}; stepping::Bool =
    false) where {FT<:AbstractFloat}
find_zero(f::Function, ms::ReduceStepMethod{FT},
    tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}}; stepping::Bool =
    false) where {FT<:AbstractFloat}
```

### Find peak
```@docs
find_peak
```

## Method options
```@docs
AbstractCRSMethod
BisectionMethod
NelderMeadMethod
NewtonBisectionMethod
NewtonRaphsonMethod
ReduceStepMethod
ReduceStepMethodND
```

## Tolerance options
```@docs
AbstractTolerance
ResidualTolerance
SolutionTolerance
SolutionToleranceND
if_break
next_xy!
```
