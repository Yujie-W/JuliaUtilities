using Documenter
using Literate
using PlotPlants




# define default docs pages
pages = Any[
    "Home" => "index.md",
    "API"  => "API.md"
]




# add example pages
gen_example = true;
gen_dir     = joinpath(@__DIR__, "src/generated");
rm(gen_dir, force=true, recursive=true);
mkpath(gen_dir);

if gen_example
    # Array of example pages
    example_pages = Any[];
    filename      = joinpath(@__DIR__, "src/examples/canvas.jl");
    script        = Literate.script(filename, gen_dir);
    code          = strip(read(script, String));
    mdpost(str)   = replace(str, "@__CODE__" => code);
    Literate.markdown(filename, gen_dir, postprocess=mdpost);
    push!(example_pages, "Canvas" => "generated/canvas.md");
    # add example pages to pages
    push!(pages, "Examples" => example_pages);
end

@show pages;




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
    sitename = "PlotPlants",
    format = format,
    clean = false,
    modules = [PlotPlants],
    pages = pages,
)




# deploy the docs to Github gh-pages
deploydocs(
    repo = "github.com/Yujie-W/PlotPlants.jl.git",
    target = "build",
    devbranch = "main",
    push_preview = true,
)
