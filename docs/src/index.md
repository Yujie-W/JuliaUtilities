# PlotPlants.jl
Yujie's PlotPlants tool.

## Usage
```julia
using PlotPlants

# use all the functions in the project
use_serif_tex();
fig,axes = create_canvas("1", ncol=2, nrow=2, ax_ind=[1,3,4]);
set_titles!(axes);
```
