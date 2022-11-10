# API
```@meta
CurrentModule = ConstrainedRootSolvers
```


## Usage
```julia
using ConstrainedRootSolvers

_f_2_solve(x) = exp(-1 * (x/2)^5) - 0.5;

sol = find_zero(_f_2_solve, BisectionMethod{Float64}(x_min=0, x_max=10), SolutionTolerance{Float64}(0.001))
sol = find_zero(_f_2_solve, NewtonBisectionMethod{Float64}(0.0, 10.0, 2.0), ResidualTolerance{Float64}(0.001))
sol = find_zero(_f_2_solve, NewtonRaphsonMethod{Float64}(2.0), ResidualTolerance{Float64}(0.001))
```


## Numerical methods

### Find zero
```@docs
find_zero
find_zero(f::Function, ms::BisectionMethod{FT}, tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}}; stepping::Bool = false) where {FT<:AbstractFloat}
find_zero(f::Function, ms::NewtonBisectionMethod{FT}, tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}}; stepping::Bool = false) where {FT<:AbstractFloat}
find_zero(f::Function, ms::NewtonRaphsonMethod{FT}, tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}}; stepping::Bool = false) where {FT<:AbstractFloat}
find_zero(f::Function, ms::ReduceStepMethod{FT}, tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}}; stepping::Bool = false) where {FT<:AbstractFloat}
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
