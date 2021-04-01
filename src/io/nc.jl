###############################################################################
#
# read_nc Wrapper using NCDatasets
#
###############################################################################
"""
NCDatasets.jl and NetCDF.jl both provide function to read data out from NC
    dataset. However, while NetCDF.jl is more convenient to use (less lines of
    code to read data), NCDatasets.jl is better to read a subset from the
    dataset and is able to detect the scale factor and offset. Here, we used a
    wrapper function to read NC dataset using NCDatasets.jl:

$(METHODLIST)

"""
function read_nc end




"""
When only file name and variable label are provided, `read_nc` function reads
    out all the data:

    read_nc(file::String, var::String)

Read data from NC file, given
- `file` Dataset path
- `var` Variable to read

Note that the missing data will be labeled as NaN.

---
Example
```julia
# read data labeled as test from test.nc
data = read_nc("test.nc", "test");
```
"""
read_nc(file::String, var::String) =
(
    _dset = Dataset(file, "r");
    _dvar = _dset[var][:,:];
    _nvar = replace(_dvar, missing=>NaN);
    _dvar = nothing;
    close(_dset);

    return _nvar
)




"""
If a float type is given, the data will be converted to FT, namely the output
    will be an array of float numbers:

    read_nc(FT, file::String, var::String)

Read data from nc file, given
- `FT` Float number type
- `file` Dataset path
- `var` Variable name

---
Example
```julia
# read data labeled as test from test.nc as Float32
data = read_nc(Float32, "test.nc", "test");
```
"""
read_nc(FT, file::String, var::String) = FT.(read_nc(file, var))




"""
In many cases, the NC dataset can be very huge, and reading all the data points
    into one array could be time and memory consuming. In this case, reading a
    subset of data would be the best option:

    read_nc(file::String, var::String, indz::Int)

Read a subset from nc file, given
- `file` Dataset path
- `var` Variable name
- `indz` The 3rd index of subset data to read

Note that the dataset must be a 3D array to use this method.

---
Example
```julia
# read 1st layer data labeled as test from test.nc
data = read_nc("test.nc", "test", 1);
```
"""
read_nc(file::String, var::String, indz::Int) =
(
    _dset = Dataset(file, "r");
    _dvar = _dset[var][:,:,indz];
    _data = replace(_dvar, missing=>NaN);
    _dvar = nothing;
    close(_dset);

    return _data
)




"""
Similarly, one may want to read the subset as a certain float type using

    read_nc(FT, file::String, var::String, indz::Int)

Read a subset from nc file, given
- `FT` Float number type
- `file` Dataset path
- `var` Variable name
- `indz` The 3rd index of subset data to read

---
Example
```julia
# read 1st layer data labeled as test from test.nc as Float32
data = read_nc(Float32, "test.nc", "test", 1);
```
"""
read_nc(FT, file::String, var::String, indz::Int) =
    FT.(read_nc(file, var, indz))








###############################################################################
#
# save Arrays to NC file
#
###############################################################################
"""
NCDatasets.jl does not have a convenient function (1 line command) to save
    dataset as a file. Thus, we provide a few methods as supplements:

$(METHODLIST)

"""
function save_nc! end




"""
This method is a case if one wants to save both variable and attributes into
    the target file. This method support saving multiple (N) dimension arrays:

    save_nc!(file::String,
             var_name::String,
             var_attr::Dict,
             var_data::Array{FT,N},
             atts_name::Vector{String},
             atts_attr::Vector{Dict},
             atts_data::Vector{Vector{FT}},
             notes::Dict{String,String}
    ) where {FT<:AbstractFloat,N}

Save dataset as NC file, given
- `file` Path to save the dataset
- `var_name` Variable name for the data in the NC file
- `var_attr` Variable attributes for the data, such as unit and long name
- `var_data` Data to save
- `atts_name` vector of supporting attribute labels, such as `lat` and `lon`
- `atts_attr` Vector of attributes for the supporting attributes, such as unit
- `atts_data` Vector of attributes data, such as the latitude range
- `notes` Global attributes (notes)

---
Example
```julia
# generate data to write into NC file
lats = collect(Float64, -85:10:85);
lons = collect(Float64, -175:10:175);
inds = collect(Int, 1:12);
data1 = rand(18) .+ 273.15;
data2 = rand(36,18) .+ 273.15;
data3 = rand(36,18,12) .+ 273.15;

# define the attributes of the dimensions and data
attrn = Dict("description" => "Random temperature", "unit" => "K");
latat = Dict("description" => "Latitude", "unit" => "°");
lonat = Dict("description" => "Longitude", "unit" => "°");
indat = Dict("description" => "Cycle index", "unit" => "-");

# define attributes names, information, and data
atts_name1 = ["lat"];
atts_name2 = ["lon", "lat"];
atts_name3 = ["lon", "lat", "ind"];
atts_attr1 = [latat];
atts_attr2 = [lonat, latat];
atts_attr3 = [lonat, latat, indat];
atts_data1 = Any[lats];
atts_data2 = Any[lons, lats];
atts_data3 = Any[lons, lats, inds];
notes = Dict("description" => "This is a file generated using PkgUtility.jl",
             "notes" => "PkgUtility.jl uses NCDatasets.jl to create NC files");

# save data as NC files (1D, 2D, and 3D)
save_nc!("data1.nc", "data1", attrn, data1, atts_name1, atts_attr1, atts_data1,
         notes);
save_nc!("data2.nc", "data2", attrn, data2, atts_name2, atts_attr2, atts_data2,
         notes);
save_nc!("data3.nc", "data3", attrn, data3, atts_name3, atts_attr3, atts_data3,
         notes);
```
"""
save_nc!(file::String,
         var_name::String,
         var_attr::Dict{String,String},
         var_data::Array{FT,N},
         atts_name::Vector{String},
         atts_attr::Vector{Dict{String,String}},
         atts_data::Vector,
         notes::Dict{String,String}
) where {FT<:AbstractFloat,N} = (
    # make sure the data provided match in dimensions
    @assert length(atts_attr) == length(atts_data) == length(atts_name) == N;

    # create a dataset using "c" mode
    _dset = Dataset(file, "c");

    # global title attribute
    for (_title,_notes) in notes
        _dset.attrib[_title] = _notes;
    end;

    # dimensions for each attribute with their own sizes
    for _i in 1:N
        defDim(_dset, atts_name[_i], length(atts_data[_i]));
        _var = defVar(_dset, atts_name[_i], eltype(atts_data[_i]), atts_name[_i:_i];
                      attrib=atts_attr[_i]);
        _var[:,:] = atts_data[_i];
    end;

    # define variable with attribute units and copy data into it
    _data = defVar(_dset, var_name, FT, atts_name; attrib=var_attr);
    _data[:,:] = var_data;

    # close dataset file
    close(_dset);

    return nothing
)




const DEFAULT_DICT = Dict(
    "about" => "This is a file generated using PkgUtility.jl",
    "notes" => "PkgUtility.jl uses NCDatasets.jl to create NC files");
"""
To save the code and effort to redefine the common attributes like latitude,
    longitude, and cycle index, we provide a shortcut method that handles these
    within the function:

    save_nc!(file::String,
             var_name::String,
             var_attr::Dict{String,String},
             var_data::Array{FT,N};
             notes::Dict{String,String} = DEFAULT_DICT
    ) where {FT<:AbstractFloat,N}

Save the 2D or 3D data as NC file, given
- `file` Path to save the dataset
- `var_name` Variable name for the data in the NC file
- `var_attr` Variable attributes for the data, such as unit and long name
- `var_data` Data to save
- `notes` Global attributes (notes)

---
Examples
```julia
# generate data to write into NC file
data2 = rand(36,18) .+ 273.15;
data3 = rand(36,18,12) .+ 273.15;

# define the attributes and notes
attrn = Dict("description" => "Random temperature", "unit" => "K");
notes = Dict("description" => "This is a file generated using PkgUtility.jl",
             "notes" => "PkgUtility.jl uses NCDatasets.jl to create NC files");

# save data as NC files (2D and 3D)
save_nc!("data2.nc", "data2", attrn, data2);
save_nc!("data2.nc", "data2", attrn, data2; notes=notes);
save_nc!("data3.nc", "data3", attrn, data3);
save_nc!("data3.nc", "data3", attrn, data3; notes=notes);
```
"""
save_nc!(file::String,
         var_name::String,
         var_attr::Dict{String,String},
         var_data::Array{FT,N};
         notes::Dict{String,String} = DEFAULT_DICT
) where {FT<:AbstractFloat,N} = (
    @assert 2 <= N <= 3;

    # generate lat and lon information based on the dimensions of the data
    _N_lat = size(var_data, 2);
    _N_lon = size(var_data, 1);
    _res_lat = FT(180) / _N_lat;
    _res_lon = FT(360) / _N_lon;
    _lats = collect(FT, _res_lat/2:_res_lat:180) .- 90;
    _lons = collect(FT, _res_lon/2:_res_lon:360) .- 180;
    if N==3
        _inds = collect(Int,1:size(var_data,3));
    end;

    # define the attributes of the dimensions and data
    _latat = Dict("description" => "Latitude", "unit" => "°");
    _lonat = Dict("description" => "Longitude", "unit" => "°");
    _indat = Dict("description" => "Cycle index", "unit" => "-");
    if N==2
        _atts_name = ["lon", "lat"];
        _atts_attr = [_lonat, _latat];
        _atts_data = Any[_lons, _lats];
    else
        _atts_name = ["lon", "lat", "ind"];
        _atts_attr = [_lonat, _latat, _indat];
        _atts_data = Any[_lons, _lats, _inds];
    end;

    # save the data to NC file
    save_nc!(file, var_name, var_attr, var_data, _atts_name, _atts_attr,
             _atts_data, notes);

    return nothing
)
