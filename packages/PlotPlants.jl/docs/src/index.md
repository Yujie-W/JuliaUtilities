# PlotPlants.jl
Yujie's PlotPlants tool.

## Usage
```julia
using PlotPlants

# use all the functions in the project
use_serif_tex();
fig,axs = create_canvas("1"; ncol=2, nrow=2, axids=[1,3,4]);
set_titles!(axs);
```

See example pages for more details.
