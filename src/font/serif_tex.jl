###############################################################################
#
# Change default font to serif
#
###############################################################################
"""
    use_serif_tex()

Set default font to serif and use latex wrapper for texts
"""
function use_serif_tex()
    rc("font"      , family="serif", serif = ["Palatino"]);
    rc("mathtext"  , fontset = "dejavuserif");
    rc("text"      , usetex=true);
    rc("text.latex", preamble="\\usepackage{amsmath,upgreek}");

    return nothing
end
