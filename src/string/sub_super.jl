###############################################################################
#
# Subscript
#
###############################################################################
"""
    subscript(ss::Number, option="mathrm")
    subscript(ss::String, option="mathrm")

Return a string of subscript, given
"""
function subscript(ss::Number, option="mathrm")
    return subscript(string(ss), option)
end




function subscript(ss::String, option="mathrm")
    if ss==""
        return ""
    else
        return "\$_\\$(option){$(ss)}\$"
    end
end








###############################################################################
#
# Superscript
#
###############################################################################
"""
    superscript(ss::Number, option="mathrm")
    superscript(ss::String, option="mathrm")

Return a string of superscript, given
"""
function superscript(ss::Number, option="mathrm")
    return superscript(string(ss), option)
end




function superscript(ss::String, option="mathrm")
    if ss==""
        return ""
    else
        return "\$^\\$(option){$(ss)}\$"
    end
end
