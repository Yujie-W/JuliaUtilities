###############################################################################
#
# Newton Raphson combined with Bi-section method for find first zero
#
###############################################################################
function find_zero(
            f::F,
            ms::NewtonBisectionMethod{FT},
            tol::AbstractTolerance{FT};
            stepping::Bool = false
) where {F<:Function, FT<:AbstractFloat}
    # create variable to store steps
    if stepping
        steps = Array{FT,1}[];
    end

    # count for iterations
    count::Int = 0;

    # calculate the values for x_min and x_max first
    x_dif = tol.tol ;
    x_min = ms.x_min;
    x_max = ms.x_max;
    y_min = f(x_min);
    y_max = f(x_max);

    # record the history
    if stepping
        push!(steps, [x_min, y_min]);
        push!(steps, [x_max, y_max]);
    end

    # if y_min and y_max are on the same side
    if y_min * y_max > 0
        if abs(y_max) < abs(y_min)
            solution = x_max;
        else
            solution = x_min;
        end

    # if y_min is 0
    elseif y_min==0
        solution = x_min;

    # if y_min and y_max are on different side, or one of them is 0
    else
        x_ntr = ms.x_ini;
        while true
            y_ntr = f(x_ntr);

            # record the history
            if stepping
                push!(steps, [x_ntr, y_ntr]);
            end

            # if difference is lower than the tolerance
            if if_break_uni(tol, x_min, x_max, y_ntr, count)
                break
            end

            # if y_ntr is on the same side with one of them
            if y_ntr * y_min > 0
                x_min = x_ntr;
                y_min = y_ntr;
            elseif y_ntr * y_max > 0
                x_max = x_ntr;
                y_max = y_ntr;

            # if y_ntr = 0 and one of y_min and y_max is 0
            elseif (y_min==0) && (y_ntr==0)
                x_min = x_ntr;
                y_min = y_ntr;
            elseif (y_max==0) && (y_ntr==0)
                x_max = x_ntr;
                y_max = y_ntr;

            # else set x_max to x_ntr (takes the fisrt one)
            else
                x_max = x_ntr;
                y_max = y_ntr;
            end

            # update x_ntr using Newton Raphson
            x_dx   = x_ntr + x_dif * 10;
            y_dx   = f(x_dx);
            slope  = (y_dx - y_ntr) / (x_dx - x_ntr);
            x_ntr -= y_ntr / slope;

            # set x_ntr in the correct range
            if (x_ntr>=x_max) || (x_ntr<=x_min) || isnan(x_ntr)
                x_ntr = (x_min + x_max) / 2;
            end

            # count ++
            count += 1;
        end

        solution = x_ntr;
    end

    # return results
    if stepping
        return solution, steps
    else
        return solution
    end
end
