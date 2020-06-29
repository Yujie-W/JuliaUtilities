using ConstrainedRootSolvers
using Documenter

generated_dir = joinpath(@__DIR__, "src", "generated") # generated files directory
rm(generated_dir, force = true, recursive = true)
mkpath(generated_dir)

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
    sitename = "ConstrainedRootSolvers.jl",
    format = format,

    clean = false,
    modules = [ConstrainedRootSolvers],
    pages = pages,
)

deploydocs(
    repo = "github.com/Yujie-W/ConstrainedRootSolvers.jl.git",
    target = "build",
    push_preview = true,
)
