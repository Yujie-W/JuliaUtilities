###############################################################################
#
# Set X and Y labels for the axis
#
###############################################################################
"""
    set_xlabels!(
                array_ax::Array,
                labels::Array{String,1};
                fontsize::Number
    )

Set X-axis labels for the axes, given
- `array_ax` An array of axis
- `labels` X-axis labels
- `fontsize` Optional: fontsize of the label
"""
function set_xlabels!(
            array_ax::Array,
            xlabels::Array{String,1};
            fontsize::Number = 16
)
    # set X-axis label for each panel
    for indx in eachindex(array_ax)
        array_ax[indx].set_xlabel(xlabels[indx], fontsize=fontsize);
    end

    return nothing
end




"""
    set_ylabels!(
                array_ax::Array,
                labels::Array{String,1};
                fontsize::Number
    )

Set Y-axis labels for the axes, given
- `array_ax` An array of axis
- `labels` Y-axis labels
- `fontsize` Optional: fontsize of the label
"""
function set_ylabels!(
            array_ax::Array,
            ylabels::Array{String,1};
            fontsize::Number = 16
)
    # set Y-axis label for each panel
    for indx in eachindex(array_ax)
        array_ax[indx].set_ylabel(ylabels[indx], fontsize=fontsize);
    end

    return nothing
end




"""
    set_xylabels!(
                array_ax::Array,
                xlabels::Array{String,1},
                ylabels::Array{String,1};
                fontsize::Number
    )

Set X-axis and Y-axis labels for the axes, given
- `array_ax` An array of axis
- `xlabels` X-axis labels
- `ylabels` Y-axis labels
- `fontsize` Optional: fontsize of the label
"""
function set_xylabels!(
            array_ax::Array,
            xlabels::Array{String,1},
            ylabels::Array{String,1};
            fontsize::Number = 16
)
    # set Y-axis label for each panel
    set_xlabels!(array_ax, xlabels; fontsize=fontsize);
    set_ylabels!(array_ax, ylabels; fontsize=fontsize);

    return nothing
end
