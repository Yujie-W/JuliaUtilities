###############################################################################
#
# Struct for regression results
#
###############################################################################
"""
    struct LinearRegressionResult

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
    lr = lm(@formula(Y ~ X), df);

    # create items for the struct
    _inter   = coef(lr)[1];
    _slope   = coef(lr)[2];
    _inter_p = coeftable(lr).cols[4][1];
    _slope_p = coeftable(lr).cols[4][1];
    _inter_ci = confint(lr)[1,:];
    _slope_ci = confint(lr)[1,:];

    # calculate the predictions
    mt   = [ones(length(df.X)) df.X];
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
