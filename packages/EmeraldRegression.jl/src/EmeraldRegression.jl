module EmeraldRegression

using DataFrames: DataFrame
using DocStringExtensions: TYPEDEF, TYPEDFIELDS
using GLM: @formula, LinearModel, adjr², coef, coeftable, confint, lm, predict


include("glm.jl")


end # module EmeraldRegression
