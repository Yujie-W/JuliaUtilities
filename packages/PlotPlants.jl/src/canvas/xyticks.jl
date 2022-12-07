###############################################################################
#
# Set ticklabels for the axis
#
###############################################################################
"""
    set_xticklabels!(axs::Array, xticklabs::Array)
    set_xticklabels!(axs::Array, xticklabs::Array{String,1})

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




function set_xticklabels!(axs::Array, xticklabs::Array{String,1})
    for indx in eachindex(axs)
        axs[indx].set_xticklabels(xticklabs);
    end

    return nothing
end




"""
    set_yticklabels!(axs::Array, yticklabs::Array)
    set_yticklabels!(axs::Array, yticklabs::Array{String,1})

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




function set_yticklabels!(axs::Array, yticklabs::Array{String,1})
    for indx in eachindex(axs)
        axs[indx].set_yticklabels(yticklabs);
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
