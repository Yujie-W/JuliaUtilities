using JuliaUtilities
using Test


@testset verbose = true "JuliaUtilities" begin
    for pkgname in ["ConstrainedRootSolvers", "NetcdfIO", "PkgUtility", "PlotPlants", "TextIO"]
        @info "Testing $(pkgname)";
        include("../packages/$(pkgname).jl/test/runtests.jl");
    end;
end;
