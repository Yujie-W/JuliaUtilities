using GLM
using PlotPlants
using Test




# Test the variable NaN recursively
function recursive_NaN_test(para)
    # if the type is Number
    if typeof(para) <: Number
        try
            @test !isnan(para)
        catch e
            println("The not NaN test failed for", para)
        end
    # if the type is array
    elseif typeof(para) <: AbstractArray
        for ele in para
            recursive_NaN_test(ele)
        end
    # if the type is Dict
    elseif typeof(para) <: Dict
        nothing
    # if the type is StatisticalModel
    elseif typeof(para) <: StatisticalModel
        nothing
    else
        # try if the parameter is a struct
        try
            for fn in fieldnames( typeof(para) )
                recursive_NaN_test( getfield(para, fn) )
            end
        catch e
            println(typeof(para), "is not supprted by recursive_NaN_test.")
        end
    end
end




include("test_plot.jl" )
include("test_stats.jl")
