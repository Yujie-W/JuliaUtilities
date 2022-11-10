
###############################################################################
#
# Choose text font
#
###############################################################################
"""
    use_sans()

Set default font to sans-serif
"""
function use_sans()
    rc("font"    , family="sans-serif", serif=["sans-serif"]);
    rc("mathtext", fontset="dejavusans");

    return nothing
end




"""
    use_serif()

Set default font to serif
"""
function use_serif()
    rc("font"    , family="serif", serif=["Palatino"]);
    rc("mathtext", fontset="dejavuserif");

    return nothing
end
