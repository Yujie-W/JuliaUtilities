# PlotPlants.jl
Yujie's PlotPlants tool.

## Usage
```julia
using PlotPlants

# use all the functions in the project
use_serif_tex();
fig,array_ax = create_canvas("1", ncol=2, nrow=2, ax_ind=[1,3,4]);
set_titles!(array_ax);
```
