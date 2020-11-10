# # Strings




# ## Initialization
using PlotPlants
#------------------------------------------------------------------------------




# ## Latex strings
# `PlotPlants` uses `PyPlot` to plot figures and render math symbols. To make
#     it more convenient to generate symbols in Latex format,
#     [`latex_symbol`](@ref) and [`latex_unit`](@ref) are provided. Also, to
#     accomendate different text renders (normal render and Latex render),
#     different options are used. For example, when normal render is used,
#     `mathrm` option is used to make strings non-italic; when Latex render is
#     used, an extra `text` option (besides `mathrm`) can be used. The
#     advantage of `text` option is that the text can be bold and italic at the
#     same time.

# ### Latex symbol
for str in [latex_symbol("G"),
            latex_symbol("LAI"),
            latex_symbol("G"; sub="sub", sup="sup"),
            latex_symbol("G"; presub="sub", presup="sup"),
            latex_symbol("G"; option="text"),
            latex_symbol("LAI"; option="text"),
            latex_symbol("G"; sub="sub", sup="sup", option="text"),
            latex_symbol("G"; presub="sub", presup="sup", option="text")]
    @show str;
end
#------------------------------------------------------------------------------

# ### pre-defined symbols (unicode and Latex)
for str in [parse_symbol("alpha"),
            parse_symbol("Omega"),
            parse_symbol("alpha", true),
            parse_symbol("Omega", true),
            parse_symbol("degc"),
            parse_symbol("degc", true)]
    @show str;
end
#------------------------------------------------------------------------------

# ### pre-defined units (unicode and Latex)
for str in [latex_unit("A"),
            latex_unit("undefined"),
            latex_unit("A"; paren=false),
            latex_unit("A"; squared=true),
            latex_unit("A"; space=true),
            latex_unit("A"; unicode=true)]
    @show str;
end
#------------------------------------------------------------------------------




# ## Text
# ### Text font
# Currently, `PlotPlants` supports sans (san-serif) and serif fonts.
use_sans();
use_serif();
#------------------------------------------------------------------------------

# ### Text render
# Currently, `PlotPlants` supports Latex and normal text renders.
use_tex();
use_text();
#------------------------------------------------------------------------------

# ### Change both text font and render
# Currently, `PlotPlants` supports Latex and normal text renders.
use_sans_tex();
use_sans_text();
use_serif_tex();
use_serif_text();
#------------------------------------------------------------------------------
