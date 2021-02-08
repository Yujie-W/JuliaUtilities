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
    rc("text"      , usetex=true);
    rc("text.latex",
       preamble = "\\usepackage{amsmath,DejaVuSans,sansmath,upgreek}" *
                  "\\sansmath");

    return nothing
end




"""
    use_sans_text()

Set default font to sans and use normal text wrapper for texts
"""
function use_sans_text()
    use_sans();
    rc("text", usetex=false);

    return nothing
end




"""
    use_serif_tex()

Set default font to serif and use latex wrapper for texts
"""
function use_serif_tex()
    use_serif();
    rc("text"      , usetex=true);
    rc("text.latex", preamble="\\usepackage{amsmath,newpxmath,newpxtext}");

    return nothing
end




"""
    use_serif_text()

Set default font to serif and use normal text wrapper for texts
"""
function use_serif_text()
    use_serif();
    rc("text", usetex=false);

    return nothing
end
