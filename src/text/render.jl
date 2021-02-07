###############################################################################
#
# Choose text font and rendering method
#
###############################################################################
"""
    use_sans_tex()

Set default font to sans and use latex wrapper for texts
"""
function use_sans_tex()
    use_sans();
    use_tex();

    return nothing
end




"""
    use_sans_text()

Set default font to sans and use normal text wrapper for texts
"""
function use_sans_text()
    use_sans();
    use_text();

    return nothing
end




"""
    use_serif_tex()

Set default font to serif and use latex wrapper for texts
"""
function use_serif_tex()
    use_serif();
    use_tex();

    return nothing
end




"""
    use_serif_text()

Set default font to serif and use normal text wrapper for texts
"""
function use_serif_text()
    use_serif();
    use_text();

    return nothing
end




"""
    use_tex()

Use latex wrapper for texts
"""
function use_tex()
    rc("text"      , usetex=true);
    rc("text.latex", preamble="\\usepackage{amsmath,upgreek,xcolor}");

    return nothing
end




"""
    use_text()

Use normal text wrapper for texts
"""
function use_text()
    rc("text", usetex=false);

    return nothing
end
