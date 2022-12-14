@testset verbose = true "EmeraldRegression" begin
    @testset "Linear Regression" begin
        x1 = rand(5);
        x2 = rand(5); x2[2] = NaN;
        yy = rand(5);

        lr1 = EmeraldRegression.linear_regress((x1,), yy);
        @test true;
        lr2 = EmeraldRegression.linear_regress((x1,1), yy);
        @test true;
        lr3 = EmeraldRegression.linear_regress((x1,x2), yy);
        @test true;
        lr4 = EmeraldRegression.linear_regress((x1,x2,1), yy);
        @test true;

        p1 = EmeraldRegression.test_slope((x1,), yy; slope = 0);
        @test true;
        p2 = EmeraldRegression.test_slope((x1,1), yy; slope = 1);
        @test true;
    end;
end;
