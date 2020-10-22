module PlotPlants

using DataFrames
using DocStringExtensions
using GLM
using KernelDensity
using NetCDF
using ProgressMeter
using PyCall
using PyPlot
using Statistics




# export public types
export AbstractFormat,
       FormatNC,
       FormatTIFF

# export functions related to plotting
export plot_density,
       plot_ellipse,
       plot_line_regress,
       plot_stoma,
       preview_dataset

# export canvas related functions
export create_canvas,
       set_titles!,
       set_xlabels!,
       set_xlims!,
       set_xticklabels!,
       set_xticks!,
       set_xylabels!,
       set_xylims!,
       set_xyticklabels!,
       set_xyticks!,
       set_ylabels!,
       set_ylims!,
       set_yticklabels!,
       set_yticks!

# statistics related function
export line_regress,
       line_regress_test_slope,
       mae,
       mape,
       nanmean,
       nanstd

# utilities
export latex_symbol,
       latex_unit,
       use_serif_tex




# include the files
include("types/file_format.jl")

include("canvas/create_canvas.jl")
include("canvas/titles.jl"       )
include("canvas/xylabels.jl"     )
include("canvas/xylims.jl"       )
include("canvas/xyticks.jl"      )

include("fitting/line_regress.jl")

include("font/serif_tex.jl")

include("plots/density.jl")
include("plots/preview.jl")

include("shape/ellipse.jl")
include("shape/stoma.jl"  )

include("statistics/line_regress.jl")
include("statistics/mae.jl"         )

include("string/symbols.jl")
include("string/units.jl"  )




end # module
