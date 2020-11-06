using GLM
using Pkg.Artifacts
using PlotPlants
using Test




include("recursive.jl")




println("\nTest the plotting functions...");
@testset "PlotPlants --- Plotting" begin
    # create data to plot
    xx = collect(Float64,1:100) .+ rand(100) ./ 2;
    yy = 0.3 .* xx;

    # use all the functions in the project
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
    x = rand(1002);
    y = rand(1002)*0.1 .+ x*0.5;
    plot_density(array_ax[2], xx, yy, markersize=8);
    plot_density(array_ax[3], x, y, markersize=8);
    calculate_density(xx,yy,2);
    calculate_density(x,y,2);
    preview_dataset(artifact"leaf_area_index_4X_1M" * "/leaf_area_index_4X_1M.nc", "LAI");
    preview_dataset(artifact"canopy_height_20X_1Y" * "/canopy_height_20X_1Y.nc", "Band1");
    println("Expecting a warning here!")
    preview_dataset(artifact"canopy_height_20X_1Y" * "/canopy_height_20X_1Y.nc", 1);
    use_serif_tex();
    @test true;
end




println("\nTest the statistics functions...");
@testset "PlotPlants --- Statistics" begin
    # linear regression
    xx = collect(Float64,1:100) .+ rand(100) ./ 2;
    yy = 0.8 .* xx;
    xx[10] = NaN;
    yy[20] = NaN;
    lr_0 = line_regress(xx, yy, intercept=false);
    lr_1 = line_regress(xx, yy, intercept=true );
    for lr in [lr_0, lr_1]
        @test NaN_test(lr.df);
    end
    @test lr_1.slope ≈ 0.8 atol=0.01;

    # linear regression test slope
    ts_0 = test_slope(xx, yy, slope=0.0);
    ts_1 = test_slope(xx, yy, slope=0.8);
    @test ts_0 < 0.05;
    @test !(ts_1 < 0.05);

    # absolute error
    for result in [ nanmax(xx),
                    nanmean(xx),
                    nanmin(xx),
                    nanstd(xx),
                    mae(lr_0.df.Y, lr_0.df.predY),
                    mape(lr_0.df.Y, lr_0.df.predY),
                    rsme(lr_0.df.Y, lr_0.df.predY) ]
        @test NaN_test(result);
    end
end
