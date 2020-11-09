###############################################################################
#
# Set titles for the axis
#
###############################################################################
"""
    set_titles!(axs::Array;
                labels::Array{String,1} = String[],
                paren::Bool = true,
                capital::Bool = false,
                dotsep::Bool = false,
                fontsize::Number = 16,
                loc::String = "center",
                usetex::Bool = true)

Set titles for the axes, given
- `axs` An array of axis
- `labels` Optional: labels after the panel title, e.g., `(a) label`
- `paren` Optional: if true, use format like `(a)`
- `capital` Optional: if true, use capital letters like `(A)`
- `dotsep` Optional: if true, add a dot after the label like `(a).`
- `fontsize` Optional: fontsize of the title
- `loc` Optional: location of the title
- `usetex` Optional: use latex render
"""
function set_titles!(
            axs::Array;
            labels::Array{String,1} = String[],
            paren::Bool = true,
            capital::Bool = false,
            dotsep::Bool = false,
            fontsize::Number = 16,
            loc::String = "center",
            usetex::Bool = true
)
    letters = ["a", "b", "c", "d", "e", "f", "g",
               "h", "i", "j", "k", "l", "m", "n",
               "o", "p", "q", "r", "s", "t",
               "u", "v", "w", "x", "y", "z"];

    # set titles for each panel
    for indx in eachindex(axs)
        _title  = "";
        _letter = letters[indx];
        _LETTER = uppercase(letters[indx]);

        usetex  ? _title *= "\\textbf{" : nothing;
        paren   ? _title *= "("         : nothing;
        capital ? _title *= _LETTER     : _title *= _letter;
        paren   ? _title *= ")"         : nothing;
        dotsep  ? _title *= "."         : nothing;
        usetex  ? _title *= "}"         : nothing;

        length(labels)>0 ? _title *= " " * labels[indx] : nothing;

        if usetex
            axs[indx].set_title(_title, fontsize=fontsize, loc=loc);
        else
            axs[indx].set_title(_title, fontsize=fontsize, loc=loc,
                                     fontweight="bold");
        end
    end

    return nothing
end
