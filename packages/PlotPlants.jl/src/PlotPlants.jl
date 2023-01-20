module PlotPlants

using DataFrames: DataFrame, sort!
using DocStringExtensions: TYPEDFIELDS
using KernelDensity: kde, pdf
using ProgressMeter: @showprogress
using PyCall: PyObject, pyimport
using PyPlot: Figure, clf, figure, rc, subplot
using Random: randstring

#using EmeraldRegression: linear_regress
#using NetcdfIO: read_nc


# include the files
include("plots/ellipse.jl")
include("plots/stoma.jl"  )


end # module
