# Test the plotting related functions
println("\nTest the plotting functions...");
@testset "PlotPlants --- Plotting" begin
    # create data to plot
    xx = collect(Float64,1:100) .+ rand(100) ./ 2;
    yy = 0.3 .* xx .+ rand(100) ./ 10;

    # use all the functions in the project
    use_serif_tex();
    fig,axes = create_canvas("1", ncol=2, nrow=2, ax_ind=[1,3,4]);
    axes[1].scatter(xx, yy);
    plot_line_regress(axes[2], xx, yy, interval=false);
    plot_line_regress(axes[3], xx, yy, interval=true);
    set_titles!(axes);
    axes[1].set_xlabel( latex_symbol("H", sub="aha") * " " * latex_unit("A") );
    axes[1].set_ylabel( latex_symbol("H", sup="aha") * " " * latex_unit("G") );
    plot_ellipse(axes[2], (1,1));
    plot_stoma(axes[3], (1,1));
    @test true;
end
