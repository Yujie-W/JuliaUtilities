###############################################################################
#
# Set X and Y limits for the axis
#
###############################################################################
"""
    set_xlims!(axs::Array, xlims::Array)
    set_xlims!(axs::Array,
               xlims::Union{Array{Int,1},Array{Float32,1},Array{Float64,1}}
    )

Set the X-axis limits, given
- `axs` Array of axis
- `xlims` Array of X-axis limits
"""
function set_xlims!(axs::Array, xlims::Array)
    # set X-axis limit for each panel
    for indx in eachindex(axs)
        axs[indx].set_xlim(xlims[indx]);
    end

    return nothing
end




function set_xlims!(
            axs::Array,
            xlims::Union{Array{Int,1},Array{Float32,1},Array{Float64,1}}
)
    # set X-axis limit for each panel
    for indx in eachindex(axs)
        axs[indx].set_xlim(xlims);
    end

    return nothing
end




"""
    set_ylims!(axs::Array, ylims::Array)
    set_ylims!(axs::Array,
               ylims::Union{Array{Int,1},Array{Float32,1},Array{Float64,1}}
    )

Set the Y-axis limits, given
- `axs` Array of axis
- `ylims` Array of Y-axis limits
"""
function set_ylims!(axs::Array, ylims::Array)
    # set Y-axis limit for each panel
    for indx in eachindex(axs)
        axs[indx].set_ylim(ylims[indx]);
    end

    return nothing
end




function set_ylims!(
            axs::Array,
            ylims::Union{Array{Int,1},Array{Float32,1},Array{Float64,1}}
)
    # set X-axis limit for each panel
    for indx in eachindex(axs)
        axs[indx].set_ylim(ylims);
    end

    return nothing
end




"""
    set_xylims!(axs::Array, xlims::Array, ylims::Array)

Set the X-axis limits, given
- `axs` Array of axis
- `xlims` Array of X-axis limits
- `ylims` Array of Y-axis limits
"""
function set_xylims!(axs::Array, xlims::Array, ylims::Array)
    set_xlims!(axs, xlims);
    set_ylims!(axs, ylims);

    return nothing
end
