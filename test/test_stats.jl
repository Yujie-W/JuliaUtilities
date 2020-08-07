# Test the statistics related functions
println("\nTest the statistics functions...");
@testset "PlotPlants --- Statistics" begin
    # linear regression
    xx = collect(Float64,1:100) .+ rand(100) ./ 2;
    yy = 0.3 .* xx .+ rand(100) ./ 10;
    xx[10] = NaN;
    yy[20] = NaN;
    lr_0 = line_regress(xx, yy, intercept=false);
    lr_1 = line_regress(xx, yy, intercept=true );
    for lr in [lr_0, lr_1]
        recursive_NaN_test(lr);
    end
    @test lr_1.slope ≈ 0.3 atol=0.01;

    # linear regression test slope
    ts_0 = line_regress_test_slope(xx, yy, slope=0.0);
    ts_1 = line_regress_test_slope(xx, yy, slope=0.3);
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
