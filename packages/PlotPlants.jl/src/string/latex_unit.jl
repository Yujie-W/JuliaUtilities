###############################################################################
#
# Latex unit
#
###############################################################################
"""
    latex_unit(id::String;
               paren::Bool = true,
               squared::Bool = false,
               space::Bool = true,
               unicode::Bool = false
    )

Return the unit, given
- `id` Identifier of the unit (if not in libary, use id as unit)
- `paren` Optional: if true, include parenthesis
- `squared` Optional: if true, use `[]`, otherwise, use `()`
- `space` Optional: if true, add a SPACE at the beginning
- `unicode` Optional. If true, return unicode; otherwise, return upgreek string

The predefined units include
- `A` μmol CO₂ m⁻² s⁻¹
- `E` mol H₂O m⁻² s⁻¹
- `E_MMOL` mmol H₂O m⁻² s⁻¹
- `G` mol m⁻² s⁻¹
- `PAR` μmol m⁻² s⁻¹
- `T` °C
- `WUE` μmol mol⁻¹
"""
function latex_unit(
            id::String;
            paren::Bool = true,
            squared::Bool = false,
            space::Bool = true,
            unicode::Bool = false
)
    # initialize with an empty String
    if space
        unit_string = " ";
    else
        unit_string = "";
    end

    # add parenthesis
    if squared
        unit_string *= "[";
    else
        unit_string *= "(";
    end

    # switch id
    if id=="A"
        _unit = parse_symbol("μ", unicode) * "mol CO" * subscript(2) *
                " m" * superscript(-2) * " s" * superscript(-1);
    elseif id=="E"
        _unit = "mol H" * subscript(2) * "O" *
                " m" * superscript(-2) * " s" * superscript(-1);
    elseif id=="E_MMOL"
        _unit = "mmol H" * subscript(2) * "O" *
                " m" * superscript(-2) * " s" * superscript(-1);
    elseif id=="G"
        _unit = "mol m" * superscript(-2) * " s" * superscript(-1);
    elseif id=="PAR"
        _unit = parse_symbol("μ", unicode) * "mol" *
                " m" * superscript(-2) * " s" * superscript(-1);
    elseif id=="T"
        _unit = parse_symbol("degc", unicode);
    elseif id=="WUE"
        _unit = parse_symbol("μ", unicode) * "mol mol" * superscript(-1);
    else
        _unit = id;
    end

    # add unit to unit_string
    unit_string *= _unit;

    # end with parenthesis
    if squared
        unit_string *= "]";
    else
        unit_string *= ")";
    end

    return unit_string
end
