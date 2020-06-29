using BenchmarkTools
using Test

using ConstrainedRootSolvers




function _r_func(x::FT) where {FT<:AbstractFloat}
    return exp( -1 * (x/2) ^ FT(0.8) ) - FT(0.5)
end

function _s_func(x::FT) where {FT<:AbstractFloat}
    return exp( -1 * (x/2) ^ 5 ) - FT(0.5)
end




# Test the performance for R-shape function
@testset "r-shape function" begin
    for FT in [Float32, Float64]
        for _method in [BisectionMethod{FT}(0,3),
                        NewtonBisectionMethod{FT}(0,3,2.7),
                        NewtonRaphsonMethod{FT}(2)]
            for _tol in [ResidualTolerance{FT}(1e-3),
                         SolutionTolerance{FT}(1e-3)]
                _solut = find_zero(_r_func, _method, _tol);
                #@btime find_zero(_r_func, $_method, $_tol);
                @test !isnan(_solut);
                @test typeof(_solut) == FT;
            end
        end
    end
end




# Test the performance for S-shape function
@testset "s-shape function" begin
    for FT in [Float32, Float64]
        for _method in [BisectionMethod{FT}(0,3),
                        NewtonBisectionMethod{FT}(0,3,2.7),
                        NewtonRaphsonMethod{FT}(2)]
            for _tol in [ResidualTolerance{FT}(1e-3),
                         SolutionTolerance{FT}(1e-3)]
                _solut = find_zero(_s_func, _method, _tol);
                #@btime find_zero(_s_func, $_method, $_tol);
                @test !isnan(_solut);
                @test typeof(_solut) == FT;
            end
        end
    end
end
