

function decorate! end

decorate!(fig::Figure) = ();

decorate!(axs::Vector;
          title_capital::Bool = false,
          title_dot::Bool = false,
          title_fontsize::Int = 16,
          title_labels::Union{Nothing, Vector{String}} = nothing,
          title_loc::String = "left",
          title_number::Bool = false,
          title_parentheses::Bool = true,
          use_latex::Bool = false) = (
    # make sure the dimenssions agree
    if !isnothing(title_labels)
        @assert length(axes) == length(title_labels);
    end;

    # decorate title for each panel
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

    return nothing
);

decorate!(ax; title::String = "", title_fontsize::Int = 16, title_loc::String = "left", use_latex::Bool = false) = (
    # decorate title
    if !isnothing(title)
        if use_latex
            ax.set_title(title, fontsize = title_fontsize, loc = title_loc);
        else
            ax.set_title(title, fontsize = title_fontsize, loc = title_loc, fontweight="bold");
        end;
    end;

    return nothing
);
