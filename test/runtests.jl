using DataFrames
using Dates
using JuliaUtilities
using LazyArtifacts
using NCDatasets
using PyPlot
using Test


@testset verbose = true "JuliaUtilities" begin
    for pkgname in ["ConstrainedRootSolvers", "EmeraldRegression", "NetcdfIO", "PkgUtility", "PlotPlants", "TextIO"]
        @info "Testing $(pkgname)";
        include("../packages/$(pkgname).jl/test/tests.jl");
    end;
end;
