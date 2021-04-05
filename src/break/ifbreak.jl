###############################################################################
#
# Judge if root is found
#
###############################################################################
"""
"""
function if_break end




"""
    if_break(
                tol::ResidualTolerance{FT},
                x1::FT,
                x2::FT,
                y::FT,
                n::Int
    ) where {FT<:AbstractFloat}
    if_break(
                tol::SolutionTolerance{FT},
                x1::FT,
                x2::FT,
                y::FT,
                n::Int
    ) where {FT<:AbstractFloat}

Determine whether to break, given
- `tol` [`ResidualTolerance`](@ref) or [`SolutionTolerance`](@ref) type
    tolerance struct
- `x1` Lower bound of x
- `x2` Upper bound of x
- `y` Residual of y
- `n` Current iteration
"""
function if_break(
            tol::ResidualTolerance{FT},
            x1::FT,
            x2::FT,
            y::FT,
            n::Int
) where {FT<:AbstractFloat}
    return (abs(y) < tol.tol) || (n > tol.n_limit)
end




function if_break(
            tol::SolutionTolerance{FT},
            x1::FT,
            x2::FT,
            y::FT,
            n::Int
) where {FT<:AbstractFloat}
    return (abs(x1-x2) < tol.tol) || (n > tol.n_limit)
end
