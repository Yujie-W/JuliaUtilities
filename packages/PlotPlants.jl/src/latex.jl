#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2022-Dec-08: refactor the functions that set text font and render
#
#######################################################################################################################################################################################################
"""

    text_render!(; font::String = "sans", use_latex::Bool = false)

Set text font and render for PyPlot, given
- `font` Font family (either sans or serif)
- `use_latex` If true, use LaTeX to render the text

"""
function set_text_render!(; font::String = "sans", use_latex::Bool = false)
    # switch between sans and serif
    @assert font in ["sans", "serif"] "Font must be sans or serif!";
    if font == "sans"
        rc("font", family="sans-serif", serif=["sans-serif"]);
        rc("mathtext", fontset="dejavusans");
    else
        rc("font", family="serif", serif=["Palatino"]);
        rc("mathtext", fontset="dejavuserif");
    end;

    # switch between LaTeX and normal renders
    rc("text", usetex = use_latex);
    if use_latex
        if font == "sans"
            rc("text.latex", preamble = "\\usepackage{amsmath,DejaVuSans,sansmath,upgreek} \\sansmath");
        else
            rc("text.latex", preamble = "\\usepackage{amsmath,newpxmath,newpxtext}");
        end;
    end;

    return nothing
end
