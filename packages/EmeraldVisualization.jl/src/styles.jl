#######################################################################################################################################################################################################
#
# Changes to these types and structs
# General
#     2023-Jan-20: add new function
#
#######################################################################################################################################################################################################
"""

Abstract type of subplot styles used for visualization for Plots.jl

$(TYPEDEF)

"""
abstract type AbstractSubplotStyle end


"""

Style for plotting global maps

$(TYPEDEF)

"""
struct GlobalMapStyle <: AbstractSubplotStyle end


#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2023-Jan-20: add new function
#
#######################################################################################################################################################################################################
"""

    set_style!(panel::Subplot, ::GlobalMapStyle; latitude_360::Bool = false)

Set the subplot style, given
- `panel` Subplot panel
- `style` Subplot style struct
- `latitude_360` If true, use 0-360 for latitude

"""
function set_style! end

set_style!(panel::Subplot, style::GlobalMapStyle; latitude_360::Bool = false) = (
    panel.attr[:framestyle] = :box;
    panel.attr[:aspect_ratio] = :equal;

    # set up the lims and ticks
    (_xmin,_xmax) = latitude_360 ? (0,360) : (-180,180);
    xlims!(panel, _xmin, _xmax);
    xticks!(panel, collect(_xmin:60:_xmax));
    ylims!(panel, -90, 90);
    yticks!(panel, collect(-90:30:90));

    return nothing
);
