###############################################################################
#
# Subscript
#
###############################################################################
"""
    subscript(ss::Number; option="mathrm", standalone=true)
    subscript(ss::String; option="mathrm", standalone=true)

Return a string of subscript, given
"""
function subscript(ss::Number; option="mathrm", standalone=true)
    return subscript(string(ss); option=option, standalone=standalone)
end




function subscript(ss::String; option="mathrm", standalone=true)
    if ss==""
        return ""
    elseif standalone
        return "\$_\\$(option){$(ss)}\$"
    else
        return "_\\$(option){$(ss)} "
    end
end








###############################################################################
#
# Superscript
#
###############################################################################
"""
    superscript(ss::Number; option="mathrm", standalone=true)
    superscript(ss::String; option="mathrm", standalone=true)

Return a string of superscript, given
"""
function superscript(ss::Number; option="mathrm", standalone=true)
    return superscript(string(ss); option=option, standalone=standalone)
end




function superscript(ss::String; option="mathrm", standalone=true)
    if ss==""
        return ""
    elseif standalone
        return "\$^\\$(option){$(ss)}\$"
    else
        return "^\\$(option){$(ss)} "
    end
end
