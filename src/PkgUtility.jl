module PkgUtility

using Dates: Date, DateTime, format, isleapyear, now
using Pkg.Artifacts: archive_artifact, artifact_exists, artifact_hash, bind_artifact!, create_artifact
using Statistics: mean, median, std
using StatsBase: percentile


# global constants
const MDAYS_LEAP  = [0,31,60,91,121,152,182,213,244,274,305,335,366];
const MDAYS       = [0,31,59,90,120,151,181,212,243,273,304,334,365];
const NDAYS_LEAP  = [31,29,31,30,31,30,31,31,30,31,30,31];
const NDAYS       = [31,28,31,30,31,30,31,31,30,31,30,31];
const TIME_FORMAT = ["YYYYMMDD", "YYYYMMDDhh", "YYYYMMDDhhmm", "YYYYMMDDhhmmss"];
const TIME_OUTPUT = ["DATE", "DATETIME", "DOY", "FDOY"];


include("../packages/PkgUtility.jl/src/macros.jl")

include("../packages/PkgUtility.jl/src/artifacts.jl" )
include("../packages/PkgUtility.jl/src/datetime.jl"  )
include("../packages/PkgUtility.jl/src/display.jl"   )
include("../packages/PkgUtility.jl/src/logs.jl"      )
include("../packages/PkgUtility.jl/src/numerical.jl" )
include("../packages/PkgUtility.jl/src/statistics.jl")
include("../packages/PkgUtility.jl/src/testing.jl"   )


end # module
