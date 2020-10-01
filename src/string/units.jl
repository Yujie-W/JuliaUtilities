###############################################################################
#
# Predefined units
#
###############################################################################
# sub- and sup- numbers
const SUB_P1 = "\$_\\text{1}\$"
const SUB_P2 = "\$_\\text{2}\$"
const SUB_P3 = "\$_\\text{3}\$"
const SUP_N1 = "\$^\\mathrm{-1}\$"
const SUP_N2 = "\$^\\mathrm{-2}\$"
const SUP_N3 = "\$^\\mathrm{-3}\$"
const SUP_P1 = "\$^\\text{1}\$"
const SUP_P2 = "\$^\\text{2}\$"
const SUP_P3 = "\$^\\text{3}\$"

# standard units
const DEGREE = "^{\\circ}"
const H_N1   = "h" * SUP_N1
const H_P1   = "h"
const K_N1   = "K" * SUP_N1
const K_P1   = "K"
const KG_N1  = "kg" * SUP_N1
const KG_P1  = "kg"
const M_N1   = "m" * SUP_N1
const M_N2   = "m" * SUP_N2
const M_N3   = "m" * SUP_N3
const M_P1   = "m"
const M_P2   = "m" * SUP_P2
const M_P3   = "m" * SUP_P3
const MOL_N1 = "mol" * SUP_N1
const MOL_P1 = "mol"
const S_N1   = "s" * SUP_N1
const S_P1   = "s"

# units based on standard units
const CELCIUS = DEGREE * "C"
const MMOL_N1 = "m" * MOL_N1
const MMOL_P1 = "m" * MOL_P1
const UMOL_N1 = "\$\\upmu\$" * MOL_N1
const UMOL_P1 = "\$\\upmu\$" * MOL_P1

# molecules
const MOLE_CO2 = "CO" * SUB_P2
const MOLE_H2O = "H" * SUB_P2 * "O"








###############################################################################
#
# Latex unit
#
###############################################################################
"""
    latex_unit(id::String; paren::Bool, squared::Bool, space::Bool)

Return the unit, given
- `id` Identifier of the unit (if not in libary, use id as unit)
- `paren` Optional: if true, include parenthesis
- `squared` Optional: if true, use `[]`, otherwise, use `()`
- `space` Optional: if true, add a SPACE at the beginning

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
            paren::Bool=true,
            squared::Bool=false,
            space::Bool=true
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
        _unit = UMOL_P1 * " " * MOLE_CO2 * " " * M_N2 * " " * S_N1;
    elseif id=="E"
        _unit = MOL_P1 * " " * MOLE_H2O * " " * M_N2 * " " * S_N1;
    elseif id=="E_MMOL"
        _unit = MMOL_P1 * " " * MOLE_H2O * " " * M_N2 * " " * S_N1;
    elseif id=="G"
        _unit = MOL_P1 * " " * M_N2 * " " * S_N1;
    elseif id=="PAR"
        _unit = UMOL_P1 * " " * M_N2 * " " * S_N1;
    elseif id=="T"
        _unit = CELCIUS;
    elseif id=="WUE"
        _unit = UMOL_P1 * " " * MOL_N1;
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
