#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2022-Dec-07: refactor the functions that set title and axes to decorate!
#     2022-Dec-07: add options to set titles
#     2022-Dec-07: add options to set x and y limits
#
#######################################################################################################################################################################################################
"""
"""
function decorate! end

decorate!(fig::Figure) = ();

decorate!(axs::Vector;
          add_title::Bool = true,
          title_capital::Bool = false,
          title_dot::Bool = false,
          title_fontsize::Int = 16,
          title_labels::Union{Nothing, Vector{String}} = nothing,
          title_loc::String = "left",
          title_number::Bool = false,
          title_parentheses::Bool = true,
          use_latex::Bool = false,
          xaxis_lims::Union{Nothing, Tuple{Number,Number}, Vector},
          yaxis_lims::Union{Nothing, Tuple{Number,Number}, Vector}) = (
    # make sure the dimenssions agree
    if !isnothing(title_labels)
        @assert length(axes) == length(title_labels) "Provided axes and title labels do not match in length!";
    end;
    if typeof(xaxis_lims) <: Vector
        @assert length(axes) == length(xaxis_lims) "Provided axes and x-axis limits do not match in length!";
    end;

    # decorate title for each panel
    if add_title
        LETTERS = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
        NUMBERS = [string(_i) for _i in 1:100];
        _labels = title_number ? NUMBERS : LETTERS;
        for _id in eachindex(axs)
            _title = "";
            _label = _labels[_id];

            use_latex                ? _title *= "\\textbf{"             : nothing;
            title_parentheses        ? _title *= "("                     : nothing;
            title_capital            ? _title *= uppercase(_label)       : _title *= _label;
            title_parentheses        ? _title *= ")"                     : nothing;
            title_dot                ? _title *= "."                     : nothing;
            use_latex                ? _title *= "}"                     : nothing;
            !isnothing(title_labels) ? _title *= " " * title_labels[_id] : nothing;

            decorate!(axs[_id]; title = _title, title_fontsize = title_fontsize, title_loc = title_loc);
        end;
    end;

    # decorate x-axis and y-axis for each panel
    if !isnothing(xaxis_lims)
        for _id in eachindex(axs)
            typeof(xaxis_lims) <: Vector ? decorate!(axs[_id]; xaxis_lims = xaxis_lims[_id]) : decorate!(axs[_id]; xaxis_lims = xaxis_lims);
        end;
    end;
    if !isnothing(yaxis_lims)
        for _id in eachindex(axs)
            typeof(yaxis_lims) <: Vector ? decorate!(axs[_id]; yaxis_lims = yaxis_lims[_id]) : decorate!(axs[_id]; yaxis_lims = yaxis_lims);
        end;
    end;

    return nothing
);

decorate!(ax;
          title::Union{Nothing, String} = nothing,
          title_fontsize::Int = 16,
          title_loc::String = "left",
          use_latex::Bool = false,
          xaxis_lims::Union{Nothing,Tuple{Number,Number}},
          yaxis_lims::Union{Nothing,Tuple{Number,Number}}) = (
    # decorate title
    if !isnothing(title)
        if use_latex
            ax.set_title(title, fontsize = title_fontsize, loc = title_loc);
        else
            ax.set_title(title, fontsize = title_fontsize, loc = title_loc, fontweight="bold");
        end;
    end;

    # decorate x-axis and y-axis
    if !isnothing(xaxis_lims) ax.set_xlim(xaxis_lims); end;
    if !isnothing(yaxis_lims) ax.set_ylim(yaxis_lims); end;

    return nothing
);
