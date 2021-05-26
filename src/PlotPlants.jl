module PlotPlants

import FileIO: load, save
import ImageIO: load, save
import ImageMagick: load, save

using DataFrames: DataFrame, sort!
using Distributed: @everywhere, addprocs, pmap, workers
using DocStringExtensions: TYPEDFIELDS
using GLM: @formula, adjr2, coef, coeftable, confint, lm, predict
using KernelDensity: kde, pdf
using PkgUtility: read_nc
using ProgressMeter: @showprogress
using PyCall: PyObject, pyimport
using PyPlot: Figure, clf, figure, rc, subplot
using Random: randstring




# export public types
export FormatNC, FormatTIFF, LinearRegressionResult

# export canvas related functions
export create_canvas, save_canvas!, save_gif!, set_titles!, set_xlabels!,
       set_xlims!, set_xticklabels!, set_xticks!, set_xylabels!, set_xylims!,
       set_xyticklabels!, set_xyticks!, set_ylabels!, set_ylims!,
       set_yticklabels!, set_yticks!

# export functions related to plotting
export plot_density!, plot_ellipse!, plot_hexbin!, plot_line_regress!,
       plot_stoma!, preview_data, preview_dataset!

# regression related functions
export line_regress

# statistics related function
export calculate_density, test_slope

# string related functions
export latex_symbol, latex_unit, parse_symbol, subscript, superscript

# text font and render functions
export use_sans, use_sans_tex, use_sans_text, use_serif, use_serif_tex,
       use_serif_text




# include the files
include("types/file_format.jl")
include("types/regression.jl" )

include("canvas/canvas.jl"  )
include("canvas/gif.jl"     )
include("canvas/titles.jl"  )
include("canvas/xylabels.jl")
include("canvas/xylims.jl"  )
include("canvas/xyticks.jl" )

include("plots/density.jl"     )
include("plots/ellipse.jl"     )
include("plots/hexbin.jl"      )
include("plots/line_regress.jl")
include("plots/preview.jl"     )
include("plots/stoma.jl"       )

include("regression/linear.jl")

include("statistics/density.jl")
include("statistics/slope.jl"  )

include("string/latex_symbol.jl")
include("string/latex_unit.jl"  )
include("string/parse_symbol.jl")
include("string/sub_super.jl"   )

include("text/font.jl"  )
include("text/render.jl")




end # module
