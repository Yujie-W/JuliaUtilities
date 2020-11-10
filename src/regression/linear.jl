###############################################################################
#
# Linear regression of Y~X
#
###############################################################################
"""
    linear_df_xy(df::DataFrame, intercept::Bool)

Linear fit the X and Y in a given DataFrame, given
- `df` DataFrame that use `X` and `Y` to store values
- `intercept` Whether using intercept when making the regression
"""
function linear_df_xy(df::DataFrame, intercept::Bool)
    # run the fitting
    if intercept
        lr = lm(@formula(Y ~ X), df);
    else
        lr = lm(@formula(Y ~ 0 + X), df);
    end

    return lr
end




"""
    line_regress(list_x::Array, list_y::Array; intercept::Bool, sorting::Bool)

Make linear regression and return the fitted results, given
- `list_x` Array of x, can be NaN
- `list_y` Array of y, can be NaN
- `intercept` Optional: if true use intercept in the fitting
- `sorting` Optional: if true, sort the values
"""
function line_regress(
            list_x::Array,
            list_y::Array;
            intercept::Bool = true,
            sorting::Bool = true
)
    # filter out NaN from the lists
    new_x = Float64[];
    new_y = Float64[];
    for (x,y) in zip(list_x, list_y)
        if ~isnan(x) && ~isnan(y)
            push!(new_x, x);
            push!(new_y, y);
        end
    end

    # put new_x and new_y into a DataFrame
    df = DataFrame(X=new_x, Y=new_y);
    sorting ? sort!(df) : nothing;

    # run the fitting
    lr = linear_df_xy(df, intercept);

    # create items for the struct
    if intercept
        _inter    = coef(lr)[1];
        _slope    = coef(lr)[2];
        _inter_p  = coeftable(lr).cols[4][1];
        _slope_p  = coeftable(lr).cols[4][2];
        _inter_ci = confint(lr)[1,:];
        _slope_ci = confint(lr)[2,:];
    else
        _inter    = Inf;
        _slope    = coef(lr)[1];
        _inter_p  = Inf;
        _slope_p  = coeftable(lr).cols[4][1];
        _inter_ci = [-Inf, Inf];
        _slope_ci = confint(lr)[1,:];
    end

    # calculate the predictions
    if intercept
        mt = [ones(length((df).X)) (df).X];
    else
        mt = (df).X[:,:];
    end
    pred = (GLM).predict(lr, mt; interval=:confidence);
    df[!,"predY" ] = pred.prediction;
    df[!,"lowerY"] = pred.lower[:,1];
    df[!,"upperY"] = pred.upper[:,1];

    return LinearRegressionResult(
                lr,
                _inter,
                _slope,
                _inter_p,
                _slope_p,
                _inter_ci,
                _slope_ci,
                df
    )
end
