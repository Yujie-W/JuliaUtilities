#######################################################################################################################################################################################################
#
# Changes to this function
# General
#     2023-Feb-15: add new function
#
#######################################################################################################################################################################################################
"""

    animate_nc!(datafile::String, varname::String; filename::Union{Nothing,String} = nothing, fps::Int = 15)

Animate the netcdf file, given
- `datafile` Path to netcdf dataset
- `varname` Variable name
- `filename` File name or path to save the animation (to gif or mp4; default is nothing)
- `fps` Frame per second (default is 15)

"""
function animate_nc!(datafile::String, varname::String; filename::Union{Nothing,String} = nothing, fps::Int = 15)
    _lats = read_nc(datafile, "lat");
    _lons = read_nc(datafile, "lon");
    _data = read_nc(datafile, varname);

    _make_frame(i) = (
        _tmp = _data[:,:,i]';
        _fig = heatmap(_lons, _lats, _tmp);
        set_style!(_fig, GlobalMapStyle());
    );

    return animation(_make_frame, collect(axes(_data,3)); filename = filename, fps = fps)
end
