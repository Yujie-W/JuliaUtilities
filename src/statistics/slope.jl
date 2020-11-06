###############################################################################
#
# Linear regression of Y~X, test slope
#
###############################################################################
"""
    test_slope(list_x::Array,
               list_y::Array;
               slope::Number = 0,
               intercept::Bool = true)

Make linear regression and return the p value of whether the regression slope
    differs from the given slope, given
- `list_x` Array of x, can be NaN
- `list_y` Array of y, can be NaN
- `slope` Slope to test
- `intercept` Optional: if true use intercept in the fitting
"""
function test_slope(
            list_x::Array,
            list_y::Array;
            slope::Number = 0,
            intercept::Bool = true
)
    # filter out NaN from the lists
    new_x = Float64[];
    new_y = Float64[];
    for (x,y) in zip(list_x, list_y)
        if ~isnan(x) && ~isnan(y)
            push!(new_x, x);
            push!(new_y, y - slope*x);
        end
    end

    # put new_x and new_y into a DataFrame
    df = DataFrame(X=new_x, Y=new_y);

    # run the fitting
    lr = linear_df_xy(df, intercept);

    # calculate the p value
    if intercept
        _slope_p = coeftable(lr).cols[4][2];
    else
        _slope_p = coeftable(lr).cols[4][1];
    end

    return _slope_p
end
