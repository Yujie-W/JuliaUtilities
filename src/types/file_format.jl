###############################################################################
#
# Abstract format type (extended from GriddingMachine.jl)
#
###############################################################################
"""
    abstract type AbstractFormat

Hierachy of AbstractFormat
- [`FormatTIFF`](@ref)
- [`FormatNC`](@ref)
"""
abstract type AbstractFormat end




"""
    struct FormatNC
"""
struct FormatNC <: AbstractFormat end




"""
    struct FormatTIFF
"""
struct FormatTIFF <: AbstractFormat end
