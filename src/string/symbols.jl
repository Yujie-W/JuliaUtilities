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
- `option` Optional: choose from `text` and `mathrm`
"""
function latex_symbol(
            mid::String;
            sub::String = "",
            sup::String = "",
            presub::String = "",
            presup::String = "",
            option::String = "text"
)
    # initialize an empty string
    symbol_string  = "";

    # start with "$
    symbol_string *= "\$ ";

    # add the pre-sub
    if length(presub) > 0
        symbol_string *= "_\\$(option){" * presub * "} ";
    end

    # add the pre-sup
    if length(presup) > 0
        symbol_string *= "^\\$(option){" * presup * "} ";
    end

    # add the mid
    if length(mid) == 1
        symbol_string *= mid * " ";
    elseif length(mid) > 1
        symbol_string *= "\\$(option){" * mid * "} "
    end

    # add the sub
    if length(sub) > 0
        symbol_string *= "_\\$(option){" * sub * "} ";
    end

    # add the sup
    if length(sup) > 0
        symbol_string *= "^\\$(option){" * sup * "} ";
    end

    # end with "$"
    symbol_string *= "\$";

    return symbol_string
end
