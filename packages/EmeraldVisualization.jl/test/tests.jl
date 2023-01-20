@testset "EmeraldVisualization" begin
    @testset "Animation" begin
        make_frame!(i) = Plots.plot(rand(i));
        EmeraldVisualization.animation(make_frame!, 1:15);
        @test true;
        EmeraldVisualization.animation(make_frame!, 1:15; filename = "test.gif", fps = 5);
        rm("tests.gif"; force = true);
        @test true;
    end;
end;
