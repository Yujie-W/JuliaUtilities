println("");
@testset "PlotPlants --- canvas related" begin
    _fig,_axes = create_canvas("New canvas", ncol=2, nrow=2);
    set_titles!(_axes);
    set_titles!(_axes; usetex=false);
    set_xylabels!(_axes, ["X" for i in 1:4], ["Y" for i in 1:4]);
    set_xylabels!(_axes, "X", "Y");
    set_xylims!(_axes, [[0,1] for i in 1:4], [[0,1] for i in 1:4]);
    set_xylims!(_axes, [0,1], [0,1]);
    set_xyticks!(_axes, [[0,1] for i in 1:4], [[0,1] for i in 1:4]);
    set_xyticks!(_axes, [0,1], [0,1]);
    set_xyticklabels!(_axes, [["",""] for i in 1:4], [["",""] for i in 1:4]);
    set_xyticklabels!(_axes, ["",""], ["",""]);
    save_canvas!(_fig, "_test.pdf", true);
    rm("_test.pdf");
    @test true;
    close("all");
    _figs = Figure[];
    push!(_figs, deepcopy(_fig));
    push!(_figs, deepcopy(_fig));
    save_gif!(_figs, 1, "test.gif");
    rm("test.gif");
    @test true;
end




println("");
@testset "PlotPlants --- plots related" begin
    _fig,_axes = create_canvas("New canvas"; ncol=3, nrow=2);
    _ax1,_ax2,_ax3,_ax4,_ax5,_ax6 = _axes;

    # density plot
    plot_density!(_ax1, rand(100), rand(100));
    @test true;

    # linear regression
    plot_line_regress!(_ax2, rand(100), rand(100), interval=true);
    @test true;

    # preview data
    preview_data(rand(5), rand(5));
    preview_dataset!(_ax3, artifact"LAI_4X_1M_V1" * "/LAI_4X_1M_V1.nc", "LAI");
    preview_dataset!(_ax3, artifact"CH_20X_1Y_V1" * "/CH_20X_1Y_V1.nc", "Band1");
    @info "Expecting a warning here!";
    preview_dataset!(_ax3, artifact"CH_20X_1Y_V1" * "/CH_20X_1Y_V1.nc", 1);
    @test true;

    # artists
    plot_ellipse!(_ax4, (0,0));
    plot_stoma!(_ax4, (0,0));
    @test true;

    # hexbin
    plot_hexbin!(_ax5, rand(100), rand(100));
    plot_hexbin!(_ax5, rand(100), rand(100); logbins=true);
    plot_hexbin!(_ax6, rand(100), rand(100), [-1,1], [-1,1]);
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
    subscript(-1; standalone=false);
    superscript(-1);
    superscript(-1; standalone=false);
    @test true;
end




println("");
@testset "PlotPlants --- string related" begin
    # fonts
    use_sans();
    use_serif();
    @test true;

    # fonts and renders
    use_sans_tex();
    use_sans_text();
    use_serif_tex();
    use_serif_text();
    @test true;
end
