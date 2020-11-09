###############################################################################
#
# Set X and Y ticks for the axis
#
###############################################################################
"""
    set_xticks!(axs::Array, xticks::Array)

Set X-axis ticks for a given
- `axs` Array of axis
- `xticks` Array of X-axis ticks
"""
function set_xticks!(axs::Array, xticks::Array)
    for indx in eachindex(axs)
        axs[indx].set_xticks(xticks[indx]);
    end

    return nothing
end




"""
    set_yticks!(axs::Array, yticks::Array)

Set Y-axis ticks for a given
- `axs` Array of axis
- `yticks` Array of Y-axis ticks
"""
function set_yticks!(axs::Array, yticks::Array)
    for indx in eachindex(axs)
        axs[indx].set_yticks(yticks[indx]);
    end

    return nothing
end




"""
    set_xyticks!(axs::Array, xticks::Array, yticks::Array)

Set Y-axis ticks for a given
- `axs` Array of axis
- `xticks` Array of X-axis ticks
- `yticks` Array of Y-axis ticks
"""
function set_xyticks!(axs::Array, xticks::Array, yticks::Array)
    set_xticks!(axs, xticks);
    set_yticks!(axs, yticks);

    return nothing
end








###############################################################################
#
# Set ticklabels for the axis
#
###############################################################################
"""
    set_xticklabels!(axs::Array, xticklabs::Array)

Set X-axis ticks for a given
- `axs` Array of axis
- `xticklabs` Array of X-axis tick labels
"""
function set_xticklabels!(axs::Array, xticklabs::Array)
    for indx in eachindex(axs)
        axs[indx].set_xticklabels(xticklabs[indx]);
    end

    return nothing
end




"""
    set_yticklabels!(axs::Array, yticklabs::Array)

Set Y-axis ticks for a given
- `axs` Array of axis
- `yticklabs` Array of Y-axis tick labels
"""
function set_yticklabels!(axs::Array, yticklabs::Array)
    for indx in eachindex(axs)
        axs[indx].set_yticklabels(yticklabs[indx]);
    end

    return nothing
end




"""
    set_xyticklabels!(axs::Array, xticklabs::Array, yticklabs::Array)

Set X-axis and Y-axis ticks for a given
- `axs` Array of axis
- `xticklabs` Array of X-axis tick labels
- `yticklabs` Array of Y-axis tick labels
"""
function set_xyticklabels!(axs::Array, xticklabs::Array, yticklabs::Array)
    set_xticklabels!(axs, xticklabs);
    set_yticklabels!(axs, yticklabs);

    return nothing
end
