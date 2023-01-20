@testset "EmeraldVisualization" begin
    @testset "Animation" begin
        make_frame!(i) = Plots.plot(rand(i));
        EmeraldVisualization.animation(make_frame!, 1:15; filename = "test1.gif", fps = 5);
        rm("test1.gif"; force = true);
        @test true;

        _anim = Plots.@animate for i in 1:15 make_frame!(i) end;
        EmeraldVisualization.animation(_anim.dir, _anim.frames; filename = "test2.gif", fps = 5);
        rm("test2.gif"; force = true);
        @test true;
    end;
end;
