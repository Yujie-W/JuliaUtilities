# PlotPlants.jl

<!-- Links and shortcuts -->
[pp-url]: https://Yujie-W.github.io/PlotPlants.jl
[pp-api]: https://yujie-w.github.io/PlotPlants.jl/stable/API/

[dev-img]: https://img.shields.io/badge/docs-dev-blue.svg
[dev-url]: https://Yujie-W.github.io/PlotPlants.jl/dev/

[rel-img]: https://img.shields.io/badge/docs-stable-blue.svg
[rel-url]: https://Yujie-W.github.io/PlotPlants.jl/stable/

[st-img]: https://github.com/Yujie-W/PlotPlants.jl/workflows/JuliaStable/badge.svg?branch=master
[st-url]: https://github.com/Yujie-W/PlotPlants.jl/actions?query=branch%3A"master"++workflow%3A"JuliaStable"

[v13-img]: https://github.com/Yujie-W/PlotPlants.jl/workflows/Julia-1.3/badge.svg?branch=master
[v13-url]: https://github.com/Yujie-W/PlotPlants.jl/actions?query=branch%3A"master"++workflow%3A"Julia-1.3"


## About

[`PlotPlants.jl`][pp-url] includes a collection of customized plotting utilities to aid the plotting using PyPlot package. Due to the dependency on [`SpecialFunctions`], this package only supports Julia 1.3 and above.

| Documentation                                   | CI Status             | Compatibility           |
|:-----------------------------------------------:|:---------------------:|:------------------------|
| [![][dev-img]][dev-url] [![][rel-img]][rel-url] | [![][st-img]][st-url] | [![][v13-img]][v13-url] |




## Dependencies

| Dependency          | Version  | Requirements |
|:--------------------|:---------|:-------------|
| DataFrames          | 0.21.6 + | Julia 1.0 +  |
| DocStringExtensions | 0.8.2 +  | Julia 0.7 +  |
| GLM                 | 1.3.10 + | Julia 1.0 +  |
| PyCall              | 1.91.4 + | Julia 0.7 +  |
| PyPlot              | 2.9.0 +  | Julia 1.0 +  |
| Revise              | 2.7.3 +  | Julia 1.0 +  |
| SpecialFunctions*   | 0.10.3+  | Julia 1.3 +  |




## Installation
```julia
julia> using Pkg;
julia> Pkg.add("PlotPlants");
```




## API
See [`API`][pp-api] for more detailed information about how to use [`PlotPlants.jl`][pp-url].
