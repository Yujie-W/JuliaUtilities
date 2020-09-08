###############################################################################
#
# Set X and Y limits for the axis
#
###############################################################################
"""
    set_xlims!(array_ax::Array, array_xl::Array)

Set the X-axis limits, given
- `array_ax` Array of axis
- `array_xl` Array of X-axis limits
"""
function set_xlims!(
            array_ax::Array,
            array_xl::Array
)
    # set X-axis limit for each panel
    for indx in eachindex(array_ax)
        array_ax[indx].set_xlim(array_xl[indx]);
    end

    return nothing
end




"""
    set_ylims!(array_ax::Array, array_yl::Array)

Set the Y-axis limits, given
- `array_ax` Array of axis
- `array_yl` Array of Y-axis limits
"""
function set_ylims!(
            array_ax::Array,
            array_yl::Array
)
    # set Y-axis limit for each panel
    for indx in eachindex(array_ax)
        array_ax[indx].set_xlim(array_yl[indx]);
    end

    return nothing
end




"""
    set_xylims!(array_ax::Array, array_xl::Array, array_yl::Array)

Set the X-axis limits, given
- `array_ax` Array of axis
- `array_xl` Array of X-axis limits
- `array_yl` Array of Y-axis limits
"""
function set_xylims!(
            array_ax::Array,
            array_xl::Array,
            array_yl::Array
)
    set_xlims!(array_ax, array_xl);
    set_ylims!(array_ax, array_yl);

    return nothing
end
