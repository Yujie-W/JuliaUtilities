#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2023-Jan-20: add new function based on Plots.jl
#
#######################################################################################################################################################################################################
"""

    animation(make_frame!::Function, inds::Union{UnitRange{Int}, Vector{Int}}; filename::Union{Nothing,String} = nothing, fps::Int = 15)

Generate animation, given
- `make_frame!` Function to make a frame
- `inds` Indices to pass to `make_frame!` function
- `filename` File name or path to save the gif (default is nothing)
- `fps` Frame per second (default is 15)

"""
function animation(make_frame!::Function, inds::Union{UnitRange{Int}, Vector{Int}}; filename::Union{Nothing,String} = nothing, fps::Int = 15)
    _anim = @animate for _i in inds
        make_frame!(_i);
    end;

    return isnothing(filename) ? gif(_anim; fps = fps) : (gif(_anim, filename; fps = fps); nothing)
end
