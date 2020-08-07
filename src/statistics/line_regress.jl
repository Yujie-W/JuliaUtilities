###############################################################################
#
# Struct for regression results
#
###############################################################################
"""
    mutable struct LinearRegressionResult

# Fields
$(DocStringExtensions.FIELDS)
"""
mutable struct LinearRegressionResult
    "Regression result"
    lm::Any

    "Intercept of fitting"
    inter::Number
    "Slope of fitting"
    slope::Number
    "P value of intercept"
    inter_p::Number
    "P value of slopes"
    slope_p::Number
    "Confidence interval of intercept"
    inter_ci::Array
    "Confidence interval of slopes"
    slope_ci::Array

    "Predictions DataFrame"
    df::DataFrame
end








###############################################################################
#
# Linear regression of Y~X
#
###############################################################################
"""
    line_regress(list_x::Array, list_y::Array; intercept::Bool, sorting::Bool)

Make linear regression and return the fitted results, given
- `list_x` Array of x, can be NaN
- `list_y` Array of y, can be NaN
- `intercept` Optional: if true use intercept in the fitting
- `sorting` Optional: if true, fort the values
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
    if intercept
        lr = lm(@formula(Y ~ X), df);
    else
        lr = lm(@formula(Y ~ 0 + X), df);
    end

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
        mt = [ones(length(df.X)) df.X];
    else
        mt = df.X[:,:];
    end
    pred = predict(lr, mt, interval=:confidence);
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








###############################################################################
#
# Linear regression of Y~X, test slope
#
###############################################################################
"""
    line_regress_test_slope(list_x::Array, list_y::Array; slope::Number, intercept::Bool)

Make linear regression and return the p value of whether the regression slope
    differs from the given slope, given
- `list_x` Array of x, can be NaN
- `list_y` Array of y, can be NaN
- `slope` Slope to test
- `intercept` Optional: if true use intercept in the fitting
"""
function line_regress_test_slope(
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
    if intercept
        lr = lm(@formula(Y ~ X), df);
    else
        lr = lm(@formula(Y ~ 0 + X), df);
    end

    # calculate the p value
    if intercept
        _slope_p = coeftable(lr).cols[4][2];
    else
        _slope_p = coeftable(lr).cols[4][1];
    end

    return _slope_p
end
