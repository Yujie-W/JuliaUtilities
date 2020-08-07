using Documenter
using PlotPlants

pages = Any[
    "Home" => "index.md",
    "API"  => "API.md"
    ]


mathengine = MathJax(Dict(
    :TeX => Dict(
        :equationNumbers => Dict(:autoNumber => "AMS"),
        :Macros => Dict(),
    ),
))

format = Documenter.HTML(
    prettyurls = get(ENV, "CI", nothing) == "true",
    mathengine = mathengine,
    collapselevel = 1,
)

makedocs(
    sitename = "PlotPlants",
    format = format,

    clean = false,
    modules = [PlotPlants],
    pages = pages,
)

deploydocs(
    repo = "github.com/Yujie-W/PlotPlants.jl.git",
    target = "build",
    push_preview = true,
)
