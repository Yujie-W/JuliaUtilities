###############################################################################
#
# Symbols
#
###############################################################################
"""
    latex_symbol(
                mid::String;
                sub::String = "",
                sup::String = "",
                presub::String = "",
                presup::String = "",
                option::String = "text")

Return the latex symbol string, given
- `mid` Center symbol, italic only when length>1
- `sub` Optional: subscript after the `mid`
- `sup` Optional: supscript after the `mid`
- `presub` Optional: subscript before the `mid`
- `presup` Optional: supscript before the `mid`
- `option` Optional: choose from `text` and `mathrm` (default)
"""
function latex_symbol(
            mid::String;
            sub::String = "",
            sup::String = "",
            presub::String = "",
            presup::String = "",
            option::String = "mathrm"
)
    # start with "\$ "
    symbol_string = "\$ ";

    # add the pre sub and sup
    symbol_string *= subscript(presub; option=option, standalone=false);
    symbol_string *= superscript(presup; option=option, standalone=false);

    # add the mid
    if length(mid) == 1
        symbol_string *= mid * " ";
    elseif length(mid) > 1
        symbol_string *= "\\$(option){" * mid * "} "
    end

    # add the sub and sup
    symbol_string *= subscript(sub; option=option, standalone=false);
    symbol_string *= superscript(sup; option=option, standalone=false);

    # end with "\$"
    symbol_string *= "\$";

    return symbol_string
end
