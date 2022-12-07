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
    (; history, x_max, x_min, xy) = ms;
    xy[1,1] = x_min;
    xy[2,1] = (x_min + x_max) / 2;
    xy[3,1] = x_max;
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




"""
This method uses residual tolerance and Nelder-Mead method, also known as
    simplex method:

    find_peak(f::Function,
              ms::NelderMeadMethod{FT},
              tol::ResidualTolerance{FT};
              stepping::Bool = false
    ) where {FT<:AbstractFloat}

Find the solution, given
- `f` A function to solve
- `ms` [`NelderMeadMethod`](@ref) type method struct
- `tol` [`ResidualTolerance`](@ref) type tolerance struct
- `stepping` Optional. If true, save the optimization steps to the history
    field in method struct.
"""
find_peak(f::Function,
          ms::NelderMeadMethod{FT},
          tol::ResidualTolerance{FT};
          stepping::Bool = false
) where {FT<:AbstractFloat} =
(
    (; N, cen_x, con_x, exp_x, history, ref_x, simplex, x_inis) = ms;
    _nX = N;
    _nS = N + 1;

    # initialize the simplex
    for _irow in 1:_nS
        simplex[_irow] .= x_inis;
        if _irow < _nS
            simplex[_irow][_irow] = x_inis[_irow] / 2;
        end;
        simplex[_irow][end] = f(simplex[_irow]);
        if stepping
            push!(history, simplex[_irow]);
        end
    end;

    # find the optimal simplex
    _count_all = 0;
    while true
        # 1. sort the simplex from high to low
        sort!(simplex, by=x->x[end], rev=true);
        if (simplex[1][end] - simplex[end][end]) < tol.tol
            break;
        end;

        # 2. calculate the centroid of the N best
        cen_x .= 0;
        for irow in 1:_nX
            cen_x .+= simplex[irow]
        end;
        cen_x ./= _nX;

        # 3. reflection of the worst
        ref_x  .= cen_x;
        ref_x .*= 2;
        ref_x .-= simplex[_nS];
        ref_x[end] = f(ref_x);
        if stepping
            push!(history, ref_x);
        end

        if simplex[1][end] >= ref_x[end] > simplex[_nX][end]
            simplex[end] .= ref_x;

        # 4. expansion of the reflection
        elseif ref_x[end] > simplex[1][end]
            exp_x  .= ref_x;
            exp_x .*= 2;
            exp_x .-= cen_x;
            exp_x[end] = f(exp_x);
            if stepping
                push!(history, exp_x);
            end

            if exp_x[end] > ref_x[end]
                simplex[end] .= exp_x;
            else
                simplex[end] .= ref_x;
            end;

        # 5. contraction of the worst
        else
            con_x  .= cen_x;
            con_x .+= simplex[_nS];
            con_x ./= 2;
            con_x[end] = f(con_x);
            if stepping
                push!(history, con_x);
            end

            if con_x[end] > simplex[_nS][end]
                simplex[end] .= con_x;

            # 6. shrink
            else
                for _irow in 2:_nS
                    simplex[_irow] .+= simplex[1];
                    simplex[_irow] ./= 2;
                    simplex[_irow][end] = f(simplex[_irow]);
                    if stepping
                        push!(history, simplex[_irow]);
                    end
                end;
            end;
        end;

        # 7. iteration ++
        _count_all += 1;

        # 8. determine whether to break
        _count_all > tol.n_limit ? break : nothing;
    end;

    return view(simplex[1], 1:_nX)
)
