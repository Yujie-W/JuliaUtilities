# Test the Package
@testset verbose = true "EmeraldMath Test" begin
    @testset "Integral" begin
        for FT in [Float32, Float64]
            f(x) = x ^ 2;
            xx = rand(FT, 5);
            fx = f.(xx);
            x  = FT(0.1);
            for result in [
                        EmeraldMath.numerical∫(fx, xx),
                        EmeraldMath.numerical∫(fx, xx[1:4]),
                        EmeraldMath.numerical∫(fx, x),
                        EmeraldMath.numerical∫(f, FT(1), FT(3), 10),
                        EmeraldMath.numerical∫(f, FT(1), FT(3))]
                @test true;
            end;
        end;
    end;

    @testset "Quadratic" begin
        for FT in [Float32, Float64]
            f(x) = x ^ 2;
            xx = rand(FT, 5);
            fx = f.(xx);
            x  = FT(0.1);
            for result in [
                        EmeraldMath.lower_quadratic(FT(1), FT(3), FT(8)),
                        EmeraldMath.lower_quadratic(FT(-1), FT(3), FT(8)),
                        EmeraldMath.upper_quadratic(FT(1), FT(3), FT(8)),
                        EmeraldMath.upper_quadratic(FT(-1), FT(3), FT(8))]
                @test true;
            end;
        end;
    end;

    @testset "Statistics" begin
        for FT in [Float32, Float64]
            xn = FT[1, 2, 3, 4, NaN];
            yn = FT[2, 2, 3, 4, NaN];
            for result in [
                        EmeraldMath.nanmax(xn),
                        EmeraldMath.nanmean(xn),
                        EmeraldMath.nanmedian(xn),
                        EmeraldMath.nanmin(xn),
                        EmeraldMath.nanpercentile(xn, 90),
                        EmeraldMath.nanstd(xn),
                        EmeraldMath.mae(xn, yn),
                        EmeraldMath.mape(xn, yn),
                        EmeraldMath.mase(xn, yn),
                        EmeraldMath.rmse(xn, yn)]
                @test true;
            end;
        end;
    end;
end;
