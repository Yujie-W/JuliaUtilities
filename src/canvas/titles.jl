###############################################################################
#
# Set titles for the axis
#
###############################################################################
"""
    set_titles!(
                array_ax::Array;
                labels::Array{String,1},
                paren::Bool,
                capital::Bool,
                fontsize::Number,
                loc::String
    )

Set titles for the axes, given
- `array_ax` An array of axis
- `labels` Optional: labels after the panel title, e.g., `(a) label`
- `paren` Optional: if true, use format like `(a)`
- `capital` Optional: if true, use capital letters like `(A)`
- `fontsize` Optional: fontsize of the title
- `loc` Optional: location of the title
"""
function set_titles!(
            array_ax::Array;
            labels::Array{String,1} = String[],
            paren::Bool = true,
            capital::Bool = false,
            fontsize::Number = 16,
            loc::String = "center"
)
    letters = ["a", "b", "c", "d", "e", "f", "g",
               "h", "i", "j", "k", "l", "m", "n",
               "o", "p", "q", "r", "s", "t",
               "u", "v", "w", "x", "y", "z"];

    # set titles for each panel
    for indx in eachindex(array_ax)
        _title  = "";
        _letter = letters[indx];
        _LETTER = uppercase(letters[indx]);

        paren   ? _title *= "\\textbf{(" : _title *= "\\textbf{";
        capital ? _title *= _LETTER      : _title *= _letter;
        paren   ? _title *= ")}"         : _title *= "}";

        length(labels)>0 ? _title *= " " * labels[indx] : nothing;

        array_ax[indx].set_title(_title, fontsize=fontsize, loc=loc);
    end

    return nothing
end
