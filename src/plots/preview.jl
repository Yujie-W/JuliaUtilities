###############################################################################
#
# Preview data
#
###############################################################################
"""
    preview_data(
                xs::Array,
                ys::Array;
                title = randstring(10),
                figsize::Tuple{Number,Number} = (4,3),
                xlab::String = "X label",
                ylab::String = "Y label",
                marker::String = "",
                linestyle::String = "-",
                label_fontsize::Int = 12
    )

Preview data, given
- `xs` Array of x
- `ys` Array of y
- `title` Axis titile
- `figsize` Canvas size
- `xlab` X axis label
- `ylab` Y axis label
- `marker` Marker style
- `linestyle` Line style
- `label_fontsize` X and Y axes label font size
"""
function preview_data(
            xs::Array,
            ys::Array;
            title = randstring(10),
            figsize::Tuple{Number,Number} = (4,3),
            xlab::String = "X label",
            ylab::String = "Y label",
            marker::String = "",
            linestyle::String = "-",
            label_fontsize::Int = 12
)
    # create canvas and axis
    fig,axs = create_canvas(title; figsize=figsize);
    ax0     = axs[1];

    # plot the data
    ax0.plot(xs, ys; marker=marker, linestyle=linestyle);
    set_xylabels!(axs, xlab, ylab, fontsize=label_fontsize);
    fig.set_tight_layout(true);

    return fig
end








###############################################################################
#
# Preview NC and TIFF files
#
###############################################################################
"""
    preview_dataset!(ax::PyObject, filename::String, label)
    preview_dataset!(
                ax::PyObject,
                filename::String,
                label::String,
                format::FormatNC
    )

Preview dataset, given
- `filename` Dataset file to preview
- `label` Label of the data to preview, variable name in NC files, band name in
    TIFF files
- `format` [`AbstractFormat`](@ref) type file format
"""
function preview_dataset!(ax::PyObject, filename::String, label)
    if filename[end-2:end]==".nc" && typeof(label)==String
        preview_dataset!(ax, filename, label, FormatNC());
    else
        @warn "File format and label type is not supported!"
    end

    return nothing
end




function preview_dataset!(
            ax::PyObject,
            filename::String,
            label::String,
            format::FormatNC
)
    data = ncread(filename, label);
    dims = size(data);

    # plot figure
    if length(dims)==2
        @info "Dataset is 2D, plotting it using imshow...";
        ax.imshow(data', origin="lower");
    elseif length(dims)==3
        @info "Dataset is 3D, plotting the 1st layer using imshow...";
        ax.imshow(data[:,:,1]', origin="lower");
    end

    return nothing
end
