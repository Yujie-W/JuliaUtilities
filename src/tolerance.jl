###############################################################################
#
# Tolerance for root solution
#
###############################################################################
"""
Abstract tolerance type

$(TYPEDEF)

"""
abstract type AbstractTolerance{FT} end




"""
Tolerance for target function residual

$(TYPEDEF)

# Fields

$(TYPEDFIELDS)

"""
struct ResidualTolerance{FT} <: AbstractTolerance{FT}
    "Tolerance for residual"
    tol::FT
    "limit of iterations"
    n_limit::Int
end




"""
Tolerance for solution

$(TYPEDEF)

# Fields

$(TYPEDFIELDS)

"""
struct SolutionTolerance{FT} <: AbstractTolerance{FT}
    "Tolerance for solution"
    tol::FT
    "limit of iterations"
    n_limit::Int
end




"""
Tolerance for 2D and above solution

$(TYPEDEF)

# Fields

$(TYPEDFIELDS)

"""
struct SolutionToleranceND{FT} <: AbstractTolerance{FT}
    "Tolerance for solution"
    tol::Array{FT,1}
    "limit of iterations"
    n_limit::Int
end




###############################################################################
#
# Judge if root is found
#
###############################################################################
"""
Determine whether to stopping finding the solution depending on the tolerance
    type.

$(METHODLIST)

"""
function if_break end




"""
When the tolerance is for target function residual, if the modeled residual is
    lower than the given tolerance, or if the iteration exceeds the maximum
    limit, a `true` will be returned.

    if_break(tol::ResidualTolerance{FT},
             x1::FT,
             x2::FT,
             y::FT,
             n::Int
    ) where {FT<:AbstractFloat}

Determine whether to break, given
- `tol` [`ResidualTolerance`](@ref) type tolerance struct
- `x1` Lower bound of x
- `x2` Upper bound of x
- `y` Residual of y
- `n` Current iteration
"""
if_break(tol::ResidualTolerance{FT},
         x1::FT,
         x2::FT,
         y::FT,
         n::Int
) where {FT<:AbstractFloat} =
    (abs(y) < tol.tol) || (n > tol.n_limit)




"""
When the tolerance is for solution, if the solution range is lower than the
    given tolerance, or if the iteration exceeds the maximum  limit, a `true`
    will be returned.

    if_break(tol::SolutionTolerance{FT},
             x1::FT,
             x2::FT,
             y::FT,
             n::Int
    ) where {FT<:AbstractFloat}

Determine whether to break, given
- `tol` [`SolutionTolerance`](@ref) type tolerance struct
- `x1` Lower bound of x
- `x2` Upper bound of x
- `y` Residual of y
- `n` Current iteration
"""
if_break(tol::SolutionTolerance{FT},
         x1::FT,
         x2::FT,
         y::FT,
         n::Int
) where {FT<:AbstractFloat} =
    (abs(x1-x2) < tol.tol) || (n > tol.n_limit)
