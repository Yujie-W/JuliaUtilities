###############################################################################
#
# Find the peak using Bisection method
# slope = 0 does not work for segmented curves
#
###############################################################################
"""
    next_xy!(f::Function,
             xy::Matrix{FT},
             history::Vector{Vector{FT}},
             stepping::Bool
    ) where {FT<:AbstractFloat}

Determine the next points to simulate, given
- `f` Function to find peak
- `xy` Matrix of x (1st column) and y (2nd column)
- `history` A vector to save simulations
- `stepping` Optional. If true, save the optimization steps to the history
    field in method struct.
"""
function next_xy!(
            f::Function,
            xy::Matrix{FT},
            history::Vector{Vector{FT}},
            stepping::Bool
) where {FT<:AbstractFloat}
    _x1,_x2,_x3,_y1,_y2,_y3 = xy;
    # if the curve if flat, do nothing
    if _y1==_y2==_y3
        return false

    # cases to update only the first part
    elseif (_y1==_y2>_y3) || (_y1>_y2)
        _xn = (_x1+_x2) / 2;
        _yn = f(_xn);
        if stepping
            push!(history, [_xn, _yn]);
        end
        xy[3,1] = _x2;
        xy[3,2] = _y2;
        xy[2,1] = _xn;
        xy[2,2] = _yn;

        return true

    # cases to update only the second part
    elseif _y1<=_y2<_y3
        _xn = (_x2+_x3) / 2;
        _yn = f(_xn);
        if stepping
            push!(history, [_xn, _yn]);
        end
        xy[1,1] = _x2;
        xy[1,2] = _y2;
        xy[2,1] = _xn;
        xy[2,2] = _yn;

        return true

    # cases to update both parts, _y1<_y2>=_y3
    else
        _xn = (_x1+_x2) / 2;
        _yn = f(_xn);
        if stepping
            push!(history, [_xn, _yn]);
        end
        if _yn >= _y2
            xy[3,1] = _x2;
            xy[3,2] = _y2;
            xy[2,1] = _xn;
            xy[2,2] = _yn;
        else
            xy[1,1] = _xn;
            xy[1,2] = _yn;

            _xn = (_x2+_x3) / 2;
            _yn = f(_xn);
            if stepping
                push!(history, [_xn, _yn]);
            end
            if _yn > _y2
                xy[1,1] = _x2;
                xy[1,2] = _y2;
                xy[2,1] = _xn;
                xy[2,2] = _yn;
            else
                xy[3,1] = _xn;
                xy[3,2] = _yn;
            end
        end

        return true
    end
end








###############################################################################
#
# Find the peak
#
###############################################################################
"""
Function to find the first root that gives a target function result of maximum.
    Note that to compute the lowest value, use -f to make it a peak.

$(METHODLIST)
"""
function find_peak end




"""
This method uses [`Bisection`](@ref) method to find the maximum. What this
    method does is to
- first calculate the `y`s at `x_min`, `x_mid`, and `x_max`
- find the point where `y` is maximum
- do bisection from the point to the `x_min` and `x_max`
- update `x_min`, `x_mid`, and `x_max`

    find_peak(f::Function,
              ms::BisectionMethod{FT},
              tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}};
              stepping::Bool = false
    ) where {FT<:AbstractFloat}

Find the solution, given
- `f` A function to solve
- `ms` [`BisectionMethod`](@ref) type method struct
- `tol` [`SolutionTolerance`](@ref) type tolerance struct
- `stepping` Optional. If true, save the optimization steps to the history
    field in method struct.
"""
find_peak(f::Function,
          ms::BisectionMethod{FT},
          tol::Union{ResidualTolerance{FT}, SolutionTolerance{FT}};
          stepping::Bool = false
) where {FT<:AbstractFloat} =
(
    # create matrix to store data
    @unpack history, xy = ms;
    xy[1,1] = ms.x_min;
    xy[2,1] = (ms.x_min + ms.x_max) / 2;
    xy[3,1] = ms.x_max;
    xy[1,2] = f(xy[1,1]);
    xy[2,2] = f(xy[2,1]);
    xy[3,2] = f(xy[3,1]);
    if stepping
        push!(history, [xy[1,1], xy[1,2]]);
        push!(history, [xy[2,1], xy[2,2]]);
        push!(history, [xy[3,1], xy[3,2]]);
    end;

    # update the xy depending on the curve shape
    _count::Int = 0;
    while next_xy!(f, xy, history, stepping)
        _count += 1;
        if if_break(tol, xy[1,1], xy[3,1], xy[1,2]-xy[3,2], _count)
            break;
        end;
    end;
    (_maxy,_indy) = findmax( view(xy, :, 2) );

    return xy[_indy,1]
)
