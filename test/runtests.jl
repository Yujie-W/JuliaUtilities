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




println("\nTest the plotting functions...");
@testset "PlotPlants --- Plotting" begin
    # create data to plot
    xx = collect(Float64,1:100) .+ rand(100) ./ 2;
    yy = 0.3 .* xx .+ rand(100) ./ 10;

    # use all the functions in the project
    use_serif_tex();
    fig,array_ax = create_canvas("1", ncol=2, nrow=2, ax_ind=[1,3,4]);
    array_ax[1].scatter(xx, yy);
    plot_line_regress(array_ax[2], xx, yy, interval=false);
    plot_line_regress(array_ax[3], xx, yy, interval=true);
    set_titles!(array_ax);
    set_xylabels!(array_ax, ["1","2","3"], ["1","2","3"]);
    set_xylims!(array_ax, [[1,2], [1,2], [1,2]], [[1,2], [1,2], [1,2]]);
    set_xyticks!(array_ax, [[1,2], [1,2], [1,2]], [[1,2], [1,2], [1,2]]);
    set_xyticklabels!(array_ax, [["1","C"], ["1","A"], ["1","B"]], [["1","C"], ["1","A"], ["1","B"]]);
    array_ax[1].set_xlabel( latex_symbol("H", sub="aha") * " " * latex_unit("A") );
    array_ax[1].set_ylabel( latex_symbol("H", sup="aha") * " " * latex_unit("G") );
    plot_ellipse(array_ax[2], (1,1));
    plot_stoma(array_ax[3], (1,1));
    @test true;
end




println("\nTest the statistics functions...");
@testset "PlotPlants --- Statistics" begin
    # linear regression
    xx = collect(Float64,1:100) .+ rand(100) ./ 2;
    yy = 0.8 .* xx .+ rand(100) ./ 10;
    xx[10] = NaN;
    yy[20] = NaN;
    lr_0 = line_regress(xx, yy, intercept=false);
    lr_1 = line_regress(xx, yy, intercept=true );
    for lr in [lr_0, lr_1]
        recursive_NaN_test(lr);
    end
    @test lr_1.slope ≈ 0.8 atol=0.01;

    # linear regression test slope
    ts_0 = line_regress_test_slope(xx, yy, slope=0.0);
    ts_1 = line_regress_test_slope(xx, yy, slope=0.8);
    @test ts_0 < 0.05;
    @test ts_1 > 0.05;

    # absolute error
    for result in [ nanmean(xx),
                    nanstd(xx),
                    mae(lr_0.df.Y, lr_0.df.predY),
                    mape(lr_0.df.Y, lr_0.df.predY) ]
        @test !isnan(result);
    end
end
