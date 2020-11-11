# # Plots

## load packages
using Pkg.Artifacts
using PlotPlants
#------------------------------------------------------------------------------




# ## Plot shapes
# ### Ellipse
_fig,_axes = create_canvas("Ellipse");
_ax1 = _axes[1];
plot_ellipse(_ax1, (0,0))
plot_ellipse(_ax1, (12,0); width=20, height=8, angle=45, color="c", alpha=0.3);
plot_ellipse(_ax1, (34,0); width=20, height=8, angle=15, edgecolor="r",
             facecolor="c", alpha=0.8);
_ax1.set_xlim(-11,45);
_ax1.set_ylim(-11,45);
_fig
#------------------------------------------------------------------------------

# ### Stoma
_fig,_axes = create_canvas("Stoma");
_ax1 = _axes[1];
plot_stoma(_ax1, (0,0));
plot_stoma(_ax1, (10,0); width=12, height=20, stoma=0.5, angle=15)
_ax1.set_xlim(-11,17);
_ax1.set_ylim(-11,17);
_fig
#------------------------------------------------------------------------------




# ## Preview global dataset
# ### lon×lat×3rd dimension
## load Artifacts.toml from PlotPlants
## leaf area index dataset, variable name: LAI
artifact_toml = joinpath(@__DIR__, "../../../Artifacts.toml");
data_hash     = artifact_hash("leaf_area_index_4X_1M", artifact_toml);
data_path     = artifact_path(data_hash) * "/leaf_area_index_4X_1M.nc";
ensure_artifact_installed("leaf_area_index_4X_1M", artifact_toml);

_fig,_axes = create_canvas("Preview 3D dataset");
_ax1 = _axes[1];
preview_dataset(_ax1, data_path, "LAI");
_fig
#------------------------------------------------------------------------------

# ### lon×lat dimension
## canopy height dataset, variable name: Band1
artifact_toml = joinpath(@__DIR__, "../../../Artifacts.toml");
data_hash     = artifact_hash("canopy_height_20X_1Y", artifact_toml);
data_path     = artifact_path(data_hash) * "/canopy_height_20X_1Y.nc";
ensure_artifact_installed("canopy_height_20X_1Y", artifact_toml);

_fig,_axes = create_canvas("Preview 2D dataset");
_ax1 = _axes[1];
preview_dataset(_ax1, data_path, "Band1");
_fig
#------------------------------------------------------------------------------

# ### Non-supported case
artifact_toml = joinpath(@__DIR__, "../../../Artifacts.toml");
data_hash     = artifact_hash("canopy_height_20X_1Y", artifact_toml);
data_path     = artifact_path(data_hash) * "/canopy_height_20X_1Y.nc";

println("Expecting a warning and thus a blank figure here!");
_fig,_axes = create_canvas("Expecting a warning");
_ax1 = _axes[1];
preview_dataset(_ax1, data_path, 1);
_fig
#------------------------------------------------------------------------------




# ## Plot regressions
# ### Linear regressions
xs = collect(1:100);
y1 = xs .* 0.01 .+ rand(100);
y2 = xs .* 0.01 .+ rand(100) .+ 2;

_fig,_axes = create_canvas("Linear regression");
_ax1 = _axes[1];
_ax1.plot(xs, y1, "ro", alpha=0.2);
plot_line_regress(_ax1, xs, y1);
_ax1.plot(xs, y2, "co", alpha=0.2);
plot_line_regress(_ax1, xs, y2; color="c");
_fig
#------------------------------------------------------------------------------

# ### Set intercept = 0
xs = collect(1:100);
ys = xs .* 0.01 .+ rand(100) .+ 2;

_fig,_axes = create_canvas("Force intercept = 0");
_ax1 = _axes[1];
_ax1.plot(xs, ys, "ro", alpha=0.2);
plot_line_regress(_ax1, xs, ys; intercept=false);
_fig
#------------------------------------------------------------------------------

# ### Plot confidence interval
xs = collect(1:100);
ys = xs .* 0.01 .+ rand(100) .+ 2;

_fig,_axes = create_canvas("Plot confidence interval");
_ax1 = _axes[1];
_ax1.plot(xs, ys, "ko", alpha=0.2);
plot_line_regress(_ax1, xs, ys; interval=true);
_fig
#------------------------------------------------------------------------------




# ## Plot density
# ### Density scatter plot
xs = [rand(100); rand(100).* 0.5; rand(100).* 0.2; rand(100).* 0.1];
ys = [rand(100); rand(100).* 0.5; rand(100).* 0.2; rand(100).* 0.1];

_fig,_axes = create_canvas("Plot confidence interval");
_ax1 = _axes[1];
plot_density(_ax1, xs, ys; cmap="viridis", markersize=10);
_fig
#------------------------------------------------------------------------------

# ### Set maximal density limit
xs = [rand(100); rand(100).* 0.5; rand(100).* 0.2; rand(100).* 0.1];
ys = [rand(100); rand(100).* 0.5; rand(100).* 0.2; rand(100).* 0.1];

_fig,_axes = create_canvas("Set maximal density limit");
_ax1 = _axes[1];
plot_density(_ax1, xs, ys; cmap="viridis", markersize=10, dmax=1);
_fig
#------------------------------------------------------------------------------