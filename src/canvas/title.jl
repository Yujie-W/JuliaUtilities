###############################################################################
#
# Create canvas
#
###############################################################################
"""
    set_titles!(axes::Array; labels::Array{String,1}, paren::Bool, capital::Bool, fontsize::Number)

Set titles for the axes, given
- `axes` An array of axes
- `labels` Optional: labels after the panel title, e.g., `(a) label`
- `paren` Optional: if true, use format like `(a)`
- `capital` Optional: if true, use capital letters like `(A)`
- `fontsize` Optional: fontsize of the title
"""
function set_titles!(
            axes::Array;
            labels::Array{String,1} = [],
            paren::Bool = true,
            capital::Bool = false,
            fontsize::Number = 16
)
    letters = ["a", "b", "c", "d", "e", "f", "g",
               "h", "i", "j", "k", "l", "m", "n",
               "o", "p", "q", "r", "s", "t",
               "u", "v", "w", "x", "y", "z"];

    # set titles for each panel
    for indx in eachindex(axes)
        _title  = "";
        _letter = letters[indx];
        _LETTER = uppercase(letters[indx]);

        paren   ? _title *= "\\textbf{(" : _title *= "\\textbf{";
        capital ? _title *= _LETTER      : _title *= _letter;
        paren   ? _title *= ")}"         : _title *= "}";

        length(labels)>0 ? _title *= " " * labels[indx] : nothing;

        axes[indx].set_title(_title, fontsize=fontsize);
    end

    return nothing
end
