# # Statistics

## load packages
using PlotPlants
#------------------------------------------------------------------------------




# ## Linear regression
# ### General linear model
# [`line_regress`](@ref) returns a [`LinearRegressionResult`](@ref) struct,
#     inside which are `lr` (GLM linear regression result), `inter`
#     (intercept), `slope`, `inter_p` (P value for intercept), `slope_p` (P
#     value for slope), `inter_ci` (intercept confidence internal), `slope_ci`
#     (slope confidence interval), and `df` (dataframe for plotting purpose).
#     By default, `df` was sorted from low X to high X. The `lowerY` and
#     `upperY` are useful to plot the confidence intervals as in
#     [`plot_line_regress!`](@ref).
xs = rand(10) .* 10;
ys = xs .* 0.05 .+ rand(10) .+ 1;
lf = line_regress(xs, ys);
@show lf.df;
lf = line_regress(xs, ys; sorting=false);
@show lf.df;
#------------------------------------------------------------------------------

# ### Set intercept = 0
lf = line_regress(xs, ys; intercept=false);
@show lf.inter;
@show lf.inter_p;
@show lf.inter_ci;
#------------------------------------------------------------------------------

# ### Is slope different from a given value
# By default [`test_slope`](@ref) returns the p value of whether the slope is
#     different from 0. Yet, you may also customize whether you want to compare
#     the slope to a given value, e.g., 1. Also, you may set the intercept as
#     0.
@show test_slope(xs, ys);
@show test_slope(xs, ys; slope=1);
@show test_slope(xs, ys; intercept=false);
#------------------------------------------------------------------------------




# ## Calculate the scatter density
# ### General calculation
# Calculating the density of large dataset can be extremely slow, and thus
#     avoiding repeating the calculation is important. Function
#     [`calculate_density`](@ref) calculates the density and returns a
#     dataframe that store the density information (sorted from low to high).
#     If total number of values exceeds 1000, a progress bar will be shown. Use
#     this function with [`plot_density!`](@ref).
N  = 100;
xs = [rand(N); rand(N).* 0.5; rand(N).* 0.2; rand(N).* 0.1];
ys = [rand(N); rand(N).* 0.5; rand(N).* 0.2; rand(N).* 0.1];
calculate_density(xs,ys);
N  = 1001;
xs = [rand(N); rand(N).* 0.5; rand(N).* 0.2; rand(N).* 0.1];
ys = [rand(N); rand(N).* 0.5; rand(N).* 0.2; rand(N).* 0.1];
calculate_density(xs,ys);
#------------------------------------------------------------------------------

# ### Multi-threading calculation
## the density will be calculated using 4 threads
calculate_density(xs,ys,4);
#------------------------------------------------------------------------------
