using ConstrainedRootSolvers
using Documenter
using PkgUtility




# define default docs pages
pages = Pair{Any,Any}[
    "Home" => "index.md",
    "API"  => "API.md"
]

@info tinfo("Pages to generate:");
pretty_display!(pages);




# format the docs
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




# build the docs
makedocs(
    sitename = "ConstrainedRootSolvers.jl",
    format = format,
    clean = false,
    modules = [ConstrainedRootSolvers],
    pages = pages,
)




# deploy the docs to Github gh-pages
deploydocs(
    repo = "github.com/Yujie-W/ConstrainedRootSolvers.jl.git",
    target = "build",
    devbranch = "main",
    push_preview = true,
)
