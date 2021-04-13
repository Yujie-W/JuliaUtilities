###############################################################################
#
# Function to find zero in the target function
#
###############################################################################
"""
Function to find the first root that gives a target function result of zero. If
    the root does not exist, the function returns the point where the target
    function is most close to zero.

$(METHODLIST)

"""
function find_zero end




"""
This method uses [`BisectionMethod`](@ref) method:

    find_zero(f::Function,
              ms::BisectionMethod{FT},
              tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}};
              stepping::Bool = false
    ) where {FT<:AbstractFloat}

Returns the solution where target function is zero, given
- `f` Function to solve
- `ms` [`BisectionMethod`](@ref) type method struct
- `tol` [`ResidualTolerance`](@ref) or [`SolutionTolerance`](@ref) type
    tolerance struct
- `stepping` Optional. If true, save the optimization steps to the history
    field in method struct.
"""
find_zero(f::Function,
          ms::BisectionMethod{FT},
          tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}};
          stepping::Bool = false
) where {FT<:AbstractFloat} =
(
    # create variable to store steps
    # _count for iterations
    _count::Int = 0;

    # calculate the values for x_min and x_max first
    _x_min = ms.x_min;
    _x_max = ms.x_max;
    _x_mid = _x_min   ;
    _y_min = f(_x_min);
    _y_max = f(_x_max);

    # record the history
    if stepping
        push!(ms.history, [_x_min, _y_min]);
        push!(ms.history, [_x_max, _y_max]);
    end;

    # if y_min and y_max are on the same side
    if _y_min * _y_max > 0
        if abs(_y_max) < abs(_y_min)
            _solution = _x_max;
        else
            _solution = _x_min;
        end;

    # if y_min is 0
    elseif _y_min==0
        _solution = _x_min;

    # if y_min and y_max are on different side, or one of them is 0
    else
        while true
            _x_mid = (_x_min + _x_max) / 2;
            _y_mid = f(_x_mid);

            # record the history
            if stepping
                push!(ms.history, [_x_mid, _y_mid]);
            end;

            # if difference is lower than the tolerance
            if if_break(tol, _x_min, _x_max, _y_mid, _count)
                break
            end;

            # if y_mid is on the same side with one of them
            if _y_mid * _y_min > 0
                _x_min = _x_mid;
                _y_min = _y_mid;
            elseif _y_mid * _y_max > 0
                _x_max = _x_mid;
                _y_max = _y_mid;

            # if y_mid = 0 and one of y_min and y_max is 0
            elseif (_y_min==0) && (_y_mid==0)
                _x_min = _x_mid;
                _y_min = _y_mid;
            elseif (_y_max==0) && (_y_mid==0)
                _x_max = _x_mid;
                _y_max = _y_mid;

            # else set x_max to x_mid (takes the fisrt one)
            else
                _x_max = _x_mid;
                _y_max = _y_mid;
            end;

            # _count ++
            _count += 1
        end;

        _solution = _x_mid;
    end;

    # return results
    return _solution
)




"""
This method uses [`NewtonBisectionMethod`](@ref) method:

    find_zero(f::Function,
              ms::NewtonBisectionMethod{FT},
              tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}};
              stepping::Bool = false
    ) where {FT<:AbstractFloat}

Returns the solution where target function is zero, given
- `f` Function to solve
- `ms` [`BisectionMethod`](@ref) type method struct
- `tol` [`ResidualTolerance`](@ref) or [`SolutionTolerance`](@ref) type
    tolerance struct
- `stepping` Optional. If true, save the optimization steps to the history
    field in method struct.
"""
find_zero(f::Function,
          ms::NewtonBisectionMethod{FT},
          tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}};
          stepping::Bool = false
) where {FT<:AbstractFloat} =
(
    # _count for iterations
    _count::Int = 0;

    # calculate the values for x_min and x_max first
    _x_dif = tol.tol ;
    _x_min = ms.x_min;
    _x_max = ms.x_max;
    _y_min = f(_x_min);
    _y_max = f(_x_max);

    # record the history
    if stepping
        push!(ms.history, [_x_min, _y_min]);
        push!(ms.history, [_x_max, _y_max]);
    end;

    # if y_min and y_max are on the same side
    if _y_min * _y_max > 0
        if abs(_y_max) < abs(_y_min)
            _solution = _x_max;
        else
            _solution = _x_min;
        end;

    # if y_min is 0
    elseif _y_min==0
        _solution = _x_min;

    # if y_min and y_max are on different side, or one of them is 0
    else
        _x_ntr = ms.x_ini;
        while true
            _y_ntr = f(_x_ntr);

            # record the history
            if stepping
                push!(ms.history, [_x_ntr, _y_ntr]);
            end;

            # if difference is lower than the tolerance
            if if_break(tol, _x_min, _x_max, _y_ntr, _count)
                break
            end;

            # if y_ntr is on the same side with one of them
            if _y_ntr * _y_min > 0
                _x_min = _x_ntr;
                _y_min = _y_ntr;
            elseif _y_ntr * _y_max > 0
                _x_max = _x_ntr;
                _y_max = _y_ntr;

            # if y_ntr = 0 and one of y_min and y_max is 0
            elseif (_y_min==0) && (_y_ntr==0)
                _x_min = _x_ntr;
                _y_min = _y_ntr;
            elseif (_y_max==0) && (_y_ntr==0)
                _x_max = _x_ntr;
                _y_max = _y_ntr;

            # else set x_max to x_ntr (takes the fisrt one)
            else
                _x_max = _x_ntr;
                _y_max = _y_ntr;
            end;

            # update x_ntr using Newton Raphson
            _x_dx   = _x_ntr + _x_dif * 10;
            _y_dx   = f(_x_dx);
            _slope  = (_y_dx - _y_ntr) / (_x_dx - _x_ntr);
            _x_ntr -= _y_ntr / _slope;

            # set x_ntr in the correct range
            if (_x_ntr>=_x_max) || (_x_ntr<=_x_min) || isnan(_x_ntr)
                _x_ntr = (_x_min + _x_max) / 2;
            end;

            # _count ++
            _count += 1;
        end;

        _solution = _x_ntr;
    end;

    # return results
    return _solution
)
