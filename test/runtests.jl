using GLM
using Pkg.Artifacts
using PlotPlants
using Test




include("recursive.jl")




println("");
@testset "PlotPlants --- canvas related" begin
    _fig,_axes = create_canvas("New canvas", ncol=2, nrow=2);
    set_titles!(_axes);
    set_titles!(_axes; usetex=false);
    set_xylabels!(_axes, ["X" for i in 1:4], ["Y" for i in 1:4]);
    set_xylims!(_axes, [[0,1] for i in 1:4], [[0,1] for i in 1:4]);
    set_xyticks!(_axes, [[0,1] for i in 1:4], [[0,1] for i in 1:4]);
    set_xyticklabels!(_axes, [["",""] for i in 1:4], [["",""] for i in 1:4]);
    @test true;
    close("all");
end




println("");
@testset "PlotPlants --- plots related" begin
    _fig,_axes = create_canvas("New canvas");
    _ax0 = _axes[1];

    # density plot
    plot_density(_ax0, rand(100), rand(100));
    @test true;

    # linear regression
    plot_line_regress(_ax0, rand(100), rand(100), interval=true);
    @test true;

    # preview data
    preview_dataset(artifact"leaf_area_index_4X_1M" * "/leaf_area_index_4X_1M.nc", "LAI");
    preview_dataset(artifact"canopy_height_20X_1Y" * "/canopy_height_20X_1Y.nc", "Band1");
    println("Expecting a warning here!")
    preview_dataset(artifact"canopy_height_20X_1Y" * "/canopy_height_20X_1Y.nc", 1);
    @test true;

    # artists
    plot_ellipse(_ax0, (0,0));
    plot_stoma(_ax0, (0,0));
    @test true;
    close("all");
end




println("");
@testset "PlotPlants --- regression related" begin
    line_regress(rand(100), rand(100); intercept=false);
    line_regress(rand(100), rand(100); intercept=true);
    @test true;
end




println("");
@testset "PlotPlants --- statistics related" begin
    # calculate density
    calculate_density(rand(100), rand(100));
    calculate_density(rand(1001), rand(1001));
    calculate_density(rand(100), rand(100), 2);
    calculate_density(rand(1001), rand(1001), 2);
    @test true;

    # test slope
    test_slope(rand(100), rand(100); intercept=false);
    test_slope(rand(100), rand(100); intercept=true);
    @test true;

    # test statistics
    xx = rand(10); xx[1]=NaN;
    yy = rand(10);
    nanmax(xx);
    nanmean(xx);
    nanmin(xx);
    nanstd(xx);
    mae(xx, yy);
    mape(xx, yy);
    rmse(xx, yy);
    @test true;
end




println("");
@testset "PlotPlants --- string related" begin
    # symbol
    latex_symbol("H", sub="sub", sup="sup");
    latex_symbol("HaHa", presub="presub", presup="presup");
    @test true;

    # unit
    latex_unit("A");
    latex_unit("E");
    latex_unit("E_MMOL");
    latex_unit("G");
    latex_unit("PAR");
    latex_unit("T");
    latex_unit("WUE"; squared=true, space=true);
    latex_unit("WUE"; squared=false, space=false);
    latex_unit("LAI");
    @test true;

    # parse symbol
    syms = ["alpha", "Alpha", "beta", "Beta", "gamma", "Gamma", "delta",
            "Delta", "epsilon", "Epsilon", "zeta", "Zeta", "eta", "Eta",
            "theta", "Theta", "iota", "Iota", "kappa", "Kappa", "lambda",
            "Lambda", "mu", "Mu", "nu", "Nu", "xi", "Xi", "pi", "Pi", "rho",
            "Rho", "sigma", "Sigma", "tau", "Tau", "upsilon", "Upsilon", "phi",
            "Phi", "chi", "Chi", "psi", "Psi", "omega", "Omega", "deg", "degc",
            "nothing"]
    parse_symbol.(syms, false);
    parse_symbol.(syms, true);
    @test true;

    # sub and superscripts
    subscript(-1);
    superscript(-1);
    @test true;
end




println("");
@testset "PlotPlants --- string related" begin
    # fonts
    use_sans();
    use_serif();
    @test true;

    # renders
    use_tex();
    use_text();
    @test true;

    # both
    use_sans_tex();
    use_sans_text();
    use_serif_tex();
    use_serif_text();
    @test true;
end
