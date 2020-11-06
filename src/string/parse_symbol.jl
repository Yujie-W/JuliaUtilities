###############################################################################
#
# Parse string to unicode or latex strings
#
###############################################################################
"""
    parse_symbol(letter::String, unicode::Bool=false)

Return the unicode or latex string, given
- `id` Identifier for the greek letter, e.g., "alpha"
- `unicode` Optional. If true, return unicode; otherwise, return upgreek string
"""
function parse_symbol(id::String, unicode::Bool=false)
    # greek letter
    if id=="alpha" || id=="α"
        letter = (unicode ? "α" : "\$\\upalpha\$");
    elseif id=="Alpha" || id=="ALPHA" || id=="Α"
        letter = (unicode ? "α" : "\$\\Upalpha\$");
    elseif id=="beta" || id=="β"
        letter = (unicode ? "β" : "\$\\upbeta\$");
    elseif id=="Beta" || id=="BETA" || id=="Β"
        letter = (unicode ? "Β" : "\$\\Upbeta\$");
    elseif id=="gamma" || id=="γ"
        letter = (unicode ? "γ" : "\$\\upgamma\$");
    elseif id=="Gamma" || id=="GAMMA" || id=="Γ"
        letter = (unicode ? "Γ" : "\$\\Upgamma\$");
    elseif id=="delta" || id=="δ"
        letter = (unicode ? "δ" : "\$\\updelta\$");
    elseif id=="Delta" || id=="DELTA" || id=="Δ"
        letter = (unicode ? "Δ" : "\$\\Updelta\$");
    elseif id=="epsilon" || id=="ϵ"
        letter = (unicode ? "ϵ" : "\$\\upepsilon\$");
    elseif id=="Epsilon" || id=="EPSILON" || id=="Ε"
        letter = (unicode ? "Ε" : "\$\\Upepsilon\$");
    elseif id=="zeta" || id=="ζ"
        letter = (unicode ? "ζ" : "\$\\upzeta\$");
    elseif id=="Zeta" || id=="ZETA" || id=="Ζ"
        letter = (unicode ? "Ζ" : "\$\\Upzeta\$");
    elseif id=="eta" || id=="η"
        letter = (unicode ? "η" : "\$\\upeta\$");
    elseif id=="Eta" || id=="ETA" || id=="Η"
        letter = (unicode ? "Η" : "\$\\Upeta\$");
    elseif id=="theta" || id=="θ"
        letter = (unicode ? "θ" : "\$\\uptheta\$");
    elseif id=="Theta" || id=="THETA" || id=="Θ"
        letter = (unicode ? "Θ" : "\$\\Uptheta\$");
    elseif id=="iota" || id=="ι"
        letter = (unicode ? "ι" : "\$\\upiota\$");
    elseif id=="Iota" || id=="IOTA" || id=="Ι"
        letter = (unicode ? "Ι" : "\$\\Upiota\$");
    elseif id=="kappa" || id=="κ"
        letter = (unicode ? "κ" : "\$\\upkappa\$");
    elseif id=="Kappa" || id=="KAPPA" || id=="Κ"
        letter = (unicode ? "Κ" : "\$\\Upkappa\$");
    elseif id=="lambda" || id=="λ"
        letter = (unicode ? "λ" : "\$\\uplambda\$");
    elseif id=="Lambda" || id=="LAMBDA" || id=="Λ"
        letter = (unicode ? "Λ" : "\$\\Uplambda\$");
    elseif id=="mu" || id=="μ"
        letter = (unicode ? "μ" : "\$\\upmu\$");
    elseif id=="Mu" || id=="MU" || id=="M"
        letter = (unicode ? "M" : "\$\\Upmu\$");
    elseif id=="nu" || id=="ν"
        letter = (unicode ? "ν" : "\$\\upnu\$");
    elseif id=="Nu" || id=="NU" || id=="N"
        letter = (unicode ? "N" : "\$\\Upnu\$");
    elseif id=="xi" || id=="ξ"
        letter = (unicode ? "ξ" : "\$\\upxi\$");
    elseif id=="Xi" || id=="XI" || id=="Ξ"
        letter = (unicode ? "Ξ" : "\$\\Upxi\$");
    elseif id=="pi" || id=="π"
        letter = (unicode ? "π" : "\$\\uppi\$");
    elseif id=="Pi" || id=="PI" || id=="Π"
        letter = (unicode ? "Π" : "\$\\Uppi\$");
    elseif id=="rho" || id=="ρ"
        letter = (unicode ? "ρ" : "\$\\uprho\$");
    elseif id=="Rho" || id=="RHO" || id=="Ρ"
        letter = (unicode ? "Ρ" : "\$\\Uprho\$");
    elseif id=="simga" || id=="σ"
        letter = (unicode ? "σ" : "\$\\upsigma\$");
    elseif id=="Sigma" || id=="SIGMA" || id=="Σ"
        letter = (unicode ? "Σ" : "\$\\Upsigma\$");
    elseif id=="tau" || id=="τ"
        letter = (unicode ? "τ" : "\$\\uptau\$");
    elseif id=="Tau" || id=="TAU" || id=="Τ"
        letter = (unicode ? "Τ" : "\$\\Uptau\$");
    elseif id=="upsilon" || id=="υ"
        letter = (unicode ? "υ" : "\$\\upupsilon\$");
    elseif id=="Upsilon" || id=="UPSILON" || id=="Υ"
        letter = (unicode ? "Υ" : "\$\\Upupsilon\$");
    elseif id=="phi" || id=="ϕ"
        letter = (unicode ? "ϕ" : "\$\\upphi\$");
    elseif id=="Phi" || id=="PHI" || id=="Φ"
        letter = (unicode ? "Φ" : "\$\\Upphi\$");
    elseif id=="chi" || id=="χ"
        letter = (unicode ? "χ" : "\$\\upchi\$");
    elseif id=="Chi" || id=="CHI" || id=="Χ"
        letter = (unicode ? "Χ" : "\$\\Upchi\$");
    elseif id=="psi" || id=="ψ"
        letter = (unicode ? "ψ" : "\$\\uppsi\$");
    elseif id=="Psi" || id=="PSI" || id=="Ψ"
        letter = (unicode ? "Ψ" : "\$\\Uppsi\$");
    elseif id=="ometa" || id=="ω"
        letter = (unicode ? "ω" : "\$\\upomega\$");
    elseif id=="Omega" || id=="OMEGA" || id=="Ω"
        letter = (unicode ? "Ω" : "\$\\Upomega\$");

    # unit symbol
    elseif lowercase(id) in ["deg", "degree", "°"]
        letter = (unicode ? "°" : "\$^{\\circ}\$");
    elseif lowercase(id) in ["degc", "degreeC", "°C"]
        letter = (unicode ? "°C" : "\$^{\\circ}\$C");

    # else, return id
    else
        letter = id;
    end

    return letter
end
