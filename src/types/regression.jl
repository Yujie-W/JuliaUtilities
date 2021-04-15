###############################################################################
#
# Struct for regression results
#
###############################################################################
"""
    mutable struct LinearRegressionResult

# Fields
$(TYPEDFIELDS)
"""
mutable struct LinearRegressionResult
    "Regression result"
    lm::Any

    "Adjusted R square"
    r2      ::Number
    "Intercept of fitting"
    inter   ::Number
    "Slope of fitting"
    slope   ::Number
    "P value of intercept"
    inter_p ::Number
    "P value of slopes"
    slope_p ::Number
    "Confidence interval of intercept"
    inter_ci::Array
    "Confidence interval of slopes"
    slope_ci::Array

    "Predictions DataFrame"
    df::DataFrame
end
