###############################################################################
#
# Set X and Y ticks for the axis
#
###############################################################################
"""
    set_xticks!(array_ax::Array, array_xtk::Array)

Set X-axis ticks for a given
- `array_ax` Array of axis
- `array_xtk` Array of X-axis ticks
"""
function set_xticks!(
            array_ax::Array,
            array_xtk::Array
)
    for indx in eachindex(array_ax)
        array_ax[indx].set_xticks(array_xtk[indx]);
    end

    return nothing
end




"""
    set_yticks!(array_ax::Array, array_ytk::Array)

Set Y-axis ticks for a given
- `array_ax` Array of axis
- `array_ytk` Array of Y-axis ticks
"""
function set_yticks!(
            array_ax::Array,
            array_ytk::Array
)
    for indx in eachindex(array_ax)
        array_ax[indx].set_yticks(array_ytk[indx]);
    end

    return nothing
end




"""
    set_xyticks!(array_ax::Array, array_xtk::Array, array_ytk::Array)

Set Y-axis ticks for a given
- `array_ax` Array of axis
- `array_xtk` Array of X-axis ticks
- `array_ytk` Array of Y-axis ticks
"""
function set_xyticks!(
            array_ax::Array,
            array_xtk::Array,
            array_ytk::Array
)
    set_xticks!(array_ax, array_xtk);
    set_yticks!(array_ax, array_ytk);

    return nothing
end








###############################################################################
#
# Set ticklabels for the axis
#
###############################################################################
"""
    set_xticklabels!(array_ax::Array, array_xtl::Array)

Set X-axis ticks for a given
- `array_ax` Array of axis
- `array_xtl` Array of X-axis tick labels
"""
function set_xticklabels!(
            array_ax::Array,
            array_xtl::Array
)
    for indx in eachindex(array_ax)
        array_ax[indx].set_xticklabels(array_xtl[indx]);
    end

    return nothing
end




"""
    set_yticklabels!(array_ax::Array, array_ytl::Array)

Set Y-axis ticks for a given
- `array_ax` Array of axis
- `array_ytl` Array of Y-axis tick labels
"""
function set_yticklabels!(
            array_ax::Array,
            array_ytl::Array
)
    for indx in eachindex(array_ax)
        array_ax[indx].set_yticklabels(array_ytl[indx]);
    end

    return nothing
end




"""
    set_xyticklabels!(array_ax::Array, array_xtl::Array, array_ytl::Array)

Set X-axis and Y-axis ticks for a given
- `array_ax` Array of axis
- `array_xtl` Array of X-axis tick labels
- `array_ytl` Array of Y-axis tick labels
"""
function set_xyticklabels!(
            array_ax::Array,
            array_xtl::Array,
            array_ytl::Array
)
    set_xticklabels!(array_ax, array_xtl);
    set_yticklabels!(array_ax, array_ytl);

    return nothing
end
