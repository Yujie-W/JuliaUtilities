@testset verbose = true "PlotPlants" begin
    @testset "Canvas" begin
        _fig = PlotPlants.canvas("New Canvas"; ncol = 2, nrow = 2);
        PlotPlants.save_canvas!(_fig, "_test");
        rm("_test.pdf");
    end;

    @testset "Decoration" begin
        _fig = PlotPlants.canvas("New Canvas"; axids = [1,2,3], ncol = 2, nrow = 2);
        PlotPlants.decorate!(_fig.axes;
                    add_title = true,
                    title_labels = ["Y1", "Y2", ""],
                    xaxis_labels = "X-axis",
                    xaxis_lims = (1,2),
                    xaxis_ticks = [1,2],
                    xaxis_ticklabels = ["A","B"],
                    yaxis_labels = ["Y1","Y2","Y3"],
                    yaxis_lims = [(1,2),(0,1),(1,3)],
                    yaxis_ticks = [[1,2],[0,1],[1,3]],
                    yaxis_ticklabels = [["A","B"],["A","B"],["A","B"]]);
    end;

    #=
    @testset "Plots" begin
        _fig,_axes = PlotPlants.create_canvas("New canvas"; ncol=3, nrow=2);
        _ax1,_ax2,_ax3,_ax4,_ax5,_ax6 = _axes;

        # density plot
        PlotPlants.plot_density!(_ax1, rand(100), rand(100));
        @test true;

        # linear regression
        PlotPlants.plot_line_regress!(_ax2, (rand(100),), rand(100), interval=true);
        @test true;

        # preview data
        PlotPlants.preview_data(rand(5), rand(5));
        PlotPlants.preview_dataset!(_ax3, artifact"LAI_4X_1M_V1" * "/LAI_4X_1M_V1.nc", "LAI");
        PlotPlants.preview_dataset!(_ax3, artifact"CH_20X_1Y_V1" * "/CH_20X_1Y_V1.nc", "Band1");
        @info "Expecting a warning here!";
        PlotPlants.preview_dataset!(_ax3, artifact"CH_20X_1Y_V1" * "/CH_20X_1Y_V1.nc", 1);
        @test true;

        # artists
        PlotPlants.plot_ellipse!(_ax4, (0,0));
        PlotPlants.plot_stoma!(_ax4, (0,0));
        @test true;

        # hexbin
        PlotPlants.plot_hexbin!(_ax5, rand(100), rand(100));
        PlotPlants.plot_hexbin!(_ax5, rand(100), rand(100); logbins=true);
        PlotPlants.plot_hexbin!(_ax6, rand(100), rand(100), [-1,1], [-1,1]);
        close("all");
    end;

    @testset "Statistics" begin
        # calculate density
        PlotPlants.calculate_density(rand(100), rand(100));
        PlotPlants.calculate_density(rand(1001), rand(1001));
        @test true;
    end;

    @testset "String" begin
        # symbol
        PlotPlants.latex_symbol("H", sub="sub", sup="sup");
        PlotPlants.latex_symbol("HaHa", presub="presub", presup="presup");
        @test true;

        # unit
        PlotPlants.latex_unit("A");
        PlotPlants.latex_unit("E");
        PlotPlants.latex_unit("E_MMOL");
        PlotPlants.latex_unit("G");
        PlotPlants.latex_unit("PAR");
        PlotPlants.latex_unit("T");
        PlotPlants.latex_unit("WUE"; squared=true, space=true);
        PlotPlants.latex_unit("WUE"; squared=false, space=false);
        PlotPlants.latex_unit("LAI");
        @test true;

        # parse symbol
        syms = ["alpha", "Alpha", "beta", "Beta", "gamma", "Gamma", "delta",
                "Delta", "epsilon", "Epsilon", "zeta", "Zeta", "eta", "Eta",
                "theta", "Theta", "iota", "Iota", "kappa", "Kappa", "lambda",
                "Lambda", "mu", "Mu", "nu", "Nu", "xi", "Xi", "pi", "Pi", "rho",
                "Rho", "sigma", "Sigma", "tau", "Tau", "upsilon", "Upsilon", "phi",
                "Phi", "chi", "Chi", "psi", "Psi", "omega", "Omega", "deg", "degc",
                "nothing"]
        PlotPlants.parse_symbol.(syms, false);
        PlotPlants.parse_symbol.(syms, true);
        @test true;

        # sub and superscripts
        PlotPlants.subscript(-1);
        PlotPlants.subscript(-1; standalone=false);
        PlotPlants.superscript(-1);
        PlotPlants.superscript(-1; standalone=false);
        @test true;
    end;

    @testset "latex" begin
        # fonts
        PlotPlants.use_sans();
        PlotPlants.use_serif();
        @test true;

        # fonts and renders
        PlotPlants.use_sans_tex();
        PlotPlants.use_sans_text();
        PlotPlants.use_serif_tex();
        PlotPlants.use_serif_text();
        @test true;
    end;
    =#
end;
