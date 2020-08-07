###############################################################################
#
# nanmean
#
###############################################################################
"""
    nanmean(x::Array)

Return the mean of array by ommiting the NaN, given
- `x` Array of numbers, can be NaN
"""
function nanmean(x::Array)
    mask = .!isnan.(x);
    return mean( x[mask] )
end








###############################################################################
#
# nanstd
#
###############################################################################
"""
    nanstd(x::Array)

Return the std of array by ommiting the NaN, given
- `x` Array of numbers, can be NaN
"""
function nanstd(x::Array)
    mask = .!isnan.(x);
    return std( x[mask] )
end








###############################################################################
#
# Mean absolute error
#
###############################################################################
"""
    mae(x::Array)

Return the mean absolute error by ommiting the NaN, given
- `y` Array of numbers, can be NaN
- `pred` Array of predictions, can be NaN
"""
function mae(y::Array, pred::Array)
    return nanmean( abs.(y .- pred) )
end








###############################################################################
#
# Mean absolute percentage error
#
###############################################################################
"""
    mae(x::Array)

Return the mean absolute percentage error by ommiting the NaN, given
- `y` Array of numbers, can be NaN
- `pred` Array of predictions, can be NaN
"""
function mape(y::Array, pred::Array)
    aver = abs( nanmean(y) );
    diff = abs.(y .- pred) ./ aver .* 100;
    return nanmean( diff )
end
