###############################################################################
#
# Set X and Y labels for the axis
#
###############################################################################
"""
    set_xlabels!(
                axs::Array,
                xlabels::Array{String,1};
                fontsize::Number = 16)

Set X-axis labels for the axes, given
- `axs` An array of axis
- `labels` X-axis labels
- `fontsize` Optional: fontsize of the label
"""
function set_xlabels!(
            axs::Array,
            xlabels::Array{String,1};
            fontsize::Number = 16
)
    # set X-axis label for each panel
    for indx in eachindex(axs)
        axs[indx].set_xlabel(xlabels[indx], fontsize=fontsize);
    end

    return nothing
end




"""
    set_ylabels!(
                axs::Array,
                ylabels::Array{String,1};
                fontsize::Number = 16)

Set Y-axis labels for the axes, given
- `axs` An array of axis
- `labels` Y-axis labels
- `fontsize` Optional: fontsize of the label
"""
function set_ylabels!(
            axs::Array,
            ylabels::Array{String,1};
            fontsize::Number = 16
)
    # set Y-axis label for each panel
    for indx in eachindex(axs)
        axs[indx].set_ylabel(ylabels[indx], fontsize=fontsize);
    end

    return nothing
end




"""
    set_xylabels!(
                axs::Array,
                xlabels::Array{String,1},
                ylabels::Array{String,1};
                fontsize::Number = 16)

Set X-axis and Y-axis labels for the axes, given
- `axs` An array of axis
- `xlabels` X-axis labels
- `ylabels` Y-axis labels
- `fontsize` Optional: fontsize of the label
"""
function set_xylabels!(
            axs::Array,
            xlabels::Array{String,1},
            ylabels::Array{String,1};
            fontsize::Number = 16
)
    # set Y-axis label for each panel
    set_xlabels!(axs, xlabels; fontsize=fontsize);
    set_ylabels!(axs, ylabels; fontsize=fontsize);

    return nothing
end
