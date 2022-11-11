module NetcdfIO

using DataFrames: DataFrame
using DocStringExtensions: METHODLIST
using NCDatasets: Dataset, defDim, defVar


# constants
const ATTR_LAT   = Dict("description" => "Latitude", "unit" => "°");
const ATTR_LON   = Dict("description" => "Longitude", "unit" => "°");
const ATTR_CYC   = Dict("description" => "Cycle index", "unit" => "-");
const ATTR_ABOUT = Dict("about" => "This is a file generated using NetcdfIO.jl",
                        "notes" => "NetcdfIO.jl uses NCDatasets.jl to read and write NC files");


# include the files
include("../packages/NetcdfIO.jl/src/append.jl")
include("../packages/NetcdfIO.jl/src/create.jl")
include("../packages/NetcdfIO.jl/src/grow.jl"  )
include("../packages/NetcdfIO.jl/src/info.jl"  )
include("../packages/NetcdfIO.jl/src/read.jl"  )
include("../packages/NetcdfIO.jl/src/save.jl"  )


end # module
