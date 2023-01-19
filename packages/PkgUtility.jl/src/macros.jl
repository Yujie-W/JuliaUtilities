#######################################################################################################################################################################################################
#
# Changes to these functions
# General
#     2022-Aug-24: move function outside of the folder
#     2023-Jan-19: make these functions to macros
#
#######################################################################################################################################################################################################
"""

    macro terror(args...)

Add a time tag to @error expression, and display the message
"""
macro terror(args...)
    quote
        @error "$(format(now(),"yyyy-mm-dd HH:MM:SS"))\n       $($(args[1]))" $(args[2:end]...)
    end
end


"""

    macro tinfo(args...)

Add a time tag to @info expression, and display the message
"""
macro tinfo(args...)
    quote
        @info "$($format($now(),"yyyy-mm-dd HH:MM:SS"))\n      $($(args[1]))" $(args[2:end]...)
    end
end


"""

    macro twarn(args...)

Add a time tag to @warn expression, and display the message
"""
macro twarn(args...)
    quote
        @warn "$(format(now(),"yyyy-mm-dd HH:MM:SS"))\n         $($(args[1]))" $(args[2:end]...)
    end
end
