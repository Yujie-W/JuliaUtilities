#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2021-Dec-24: migrate the function from PkgUtility to NetcdfIO
#     2022-Jan-28: fix documentation
#
#######################################################################################################################################################################################################
"""
NCDatasets.jl and NetCDF.jl both provide function to read data out from NC dataset. However, while NetCDF.jl is more convenient to use (less lines of code to read data), NCDatasets.jl is better to
    read a subset from the dataset and is able to detect the scale factor and offset. Here, we used a wrapper function to read NC dataset using NCDatasets.jl:

$(METHODLIST)

"""
function read_nc end


#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2021-Dec-24: migrate the function from PkgUtility to NetcdfIO
#     2022-Jan-28: fix documentation
# Bug fixes
#     2021-Dec-24: fix the bug that reads integer as float (e.g., ind)
#
#######################################################################################################################################################################################################
"""
When only file name and variable label are provided, `read_nc` function reads out all the data:

    read_nc(file::String, var_name::String)

Read data from NC file, given
- `file` Path of the netcdf dataset
- `var_name` Variable to read

Note that the missing data will be labeled as NaN.

---
# Examples
```julia
# read data labeled as test from test.nc
data = read_nc("test.nc", "test");
```
"""
read_nc(file::String, var_name::String) = (
    _dset = Dataset(file, "r");
    _dvar = _dset[var_name][:,:];
    close(_dset);

    if sum(ismissing.(_dvar)) == 0
        return _dvar
    end;

    return replace(_dvar, missing=>NaN)
);


#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2021-Dec-24: migrate the function from PkgUtility to NetcdfIO
#     2022-Jan-28: fix documentation
#
#######################################################################################################################################################################################################
"""
If a float type is given, the data will be converted to T, namely the output will be an array of T type numbers:

    read_nc(T, file::String, var_name::String)

Read data from nc file, given
- `T` Number type
- `file` Path of the netcdf dataset
- `var_name` Variable name

---
# Examples
```julia
# read data labeled as test from test.nc as Float32
data = read_nc(Float32, "test.nc", "test");
```
"""
read_nc(T, file::String, var_name::String) = T.(read_nc(file, var_name));


#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2021-Dec-24: migrate the function from PkgUtility to NetcdfIO
#     2022-Jan-28: fix documentation
# Bug fixes
#     2021-Dec-24: fix the bug that reads integer as float (e.g., ind)
#     2022-Jan-20: add dimension control to avoid errors
#
#######################################################################################################################################################################################################
"""
In many cases, the NC dataset can be very huge, and reading all the data points into one array could be time and memory consuming. In this case, reading a subset of data would be the best option:

    read_nc(file::String, var_name::String, indz::Int)

Read a subset from nc file, given
- `file` Path of the netcdf dataset
- `var_name` Variable name
- `indz` The 3rd index of subset data to read

Note that the dataset must be a 3D array to use this method.

---
# Examples
```julia
# read 1st layer data labeled as test from test.nc
data = read_nc("test.nc", "test", 1);
```
"""
read_nc(file::String, var_name::String, indz::Int) = (
    @assert size_nc(file, var_name)[1] == 3 "The dataset must be a 3D array to use this method!";

    _dset = Dataset(file, "r");
    _dvar = _dset[var_name][:,:,indz];
    close(_dset);

    if sum(ismissing.(_dvar)) == 0
        return _dvar
    end;

    return replace(_dvar, missing=>NaN)
);


#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2021-Dec-24: migrate the function from PkgUtility to NetcdfIO
#     2022-Jan-28: fix documentation
#
#######################################################################################################################################################################################################
"""
Similarly, one may want to read the subset as a certain type using

    read_nc(T, file::String, var_name::String, indz::Int)

Read a subset from nc file, given
- `T` Number type
- `file` Path of the netcdf dataset
- `var_name` Variable name
- `indz` The 3rd index of subset data to read

---
# Examples
```julia
# read 1st layer data labeled as test from test.nc as Float32
data = read_nc(Float32, "test.nc", "test", 1);
```
"""
read_nc(T, file::String, var_name::String, indz::Int) = T.(read_nc(file, var_name, indz));


#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2021-Dec-24: migrate the function from PkgUtility to NetcdfIO
#     2022-Jan-28: fix documentation
# Bug fixes
#     2021-Dec-24: fix the bug that reads integer as float (e.g., ind)
#     2022-Jan-20: add dimension control to avoid errors
#
#######################################################################################################################################################################################################
"""
Another convenient wrapper is to read all the data for given index in x and y, for example, if one wants to read the time series of data at a given site:

    read_nc(file::String, var_name::String, indx::Int, indy::Int)

Read the time series of data for a site, given
- `file` Path of the netcdf dataset
- `var_name` Variable name
- `indx` The 1st index of subset data to read, typically longitude
- `indy` The 2nd index of subset data to read, typically latitude

---
# Examples
```julia
data = read_nc("test.nc", "test", 1, 1);
```
"""
read_nc(file::String, var_name::String, indx::Int, indy::Int) = (
    _ndim = size_nc(file, var_name)[1];
    @assert 2 <= _ndim <= 3 "The dataset must be a 2D or 3D array to use this method!";

    _dset = Dataset(file, "r");
    _dvar = (_ndim==2 ? _dset[var_name][indx,indy] : _dset[var_name][indx,indy,:]);
    close(_dset);

    if sum(ismissing.(_dvar)) == 0
        return _dvar
    end;

    return replace(_dvar, missing=>NaN)
);


#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2021-Dec-24: migrate the function from PkgUtility to NetcdfIO
#     2022-Jan-28: fix documentation
#
#######################################################################################################################################################################################################
"""
Similarly, one may want to read the subset as a certain type using

    read_nc(T, file::String, var_name::String, indx::Int, indy::Int)

Read the time series of data for a site, given
- `T` Number type
- `file` Path of the netcdf dataset
- `var_name` Variable name
- `indx` The 1st index of subset data to read, typically longitude
- `indy` The 2nd index of subset data to read, typically latitude

---
# Examples
```julia
data = read_nc(Float32, "test.nc", "test", 1, 1);
```
"""
read_nc(T, file::String, var_name::String, indx::Int, indy::Int) = T.(read_nc(file, var_name, indx, indy));


#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2021-Dec-24: migrate the function from PkgUtility to NetcdfIO
#     2022-Jan-28: fix documentation
# Bug fixes
#     2021-Dec-24: fix the bug that reads integer as float (e.g., ind)
#     2022-Jan-20: add dimension control to avoid errors
#
#######################################################################################################################################################################################################
"""
Another convenient wrapper is to read the data for given index in x, y, and z, for example, if one wants to read the time series of data at a given site:

    read_nc(file::String, var_name::String, indx::Int, indy::Int, indz::Int)

Read the time series of data for a site, given
- `file` Path of the netcdf dataset
- `var_name` Variable name
- `indx` The 1st index of subset data to read, typically longitude
- `indy` The 2nd index of subset data to read, typically latitude
- `indz` The 3rd index of subset data to read, typically time

---
# Examples
```julia
data = read_nc("test.nc", "test", 1, 1, 1);
```
"""
read_nc(file::String, var_name::String, indx::Int, indy::Int, indz::Int) = (
    @assert size_nc(file, var_name)[1] == 3 "The dataset must be a 3D array to use this method!";

    _dset = Dataset(file, "r");
    _dvar = _dset[var_name][indx,indy,indz];
    close(_dset);

    return ismissing(_dvar) ? NaN : _dvar
);


#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2021-Dec-24: migrate the function from PkgUtility to NetcdfIO
#     2022-Jan-28: fix documentation
#
#######################################################################################################################################################################################################
"""
Similarly, one may want to read the data as a certain type using

    read_nc(T, file::String, var_name::String, indx::Int, indy::Int, indz::Int)

Read the time series of data for a site, given
- `T` Number type
- `file` Path of the netcdf dataset
- `var_name` Variable name
- `indx` The 1st index of subset data to read, typically longitude
- `indy` The 2nd index of subset data to read, typically latitude
- `indz` The 3rd index of subset data to read, typically time

---
# Examples
```julia
data = read_nc(Float32, "test.nc", "test", 1, 1, 1);
```
"""
read_nc(T, file::String, var_name::String, indx::Int, indy::Int, indz::Int) = T.(read_nc(file, var_name, indx, indy, indz));


#######################################################################################################################################################################################################
#
# Changes to the function
# General
#     2022-Jan-04: add this function to read netcdf as DataFrame
#     2022-Jan-28: fix documentation
# Bug fixes
#     2021-Dec-24: fix the bug that reads integer as float (e.g., ind)
#
#######################################################################################################################################################################################################
"""
The method below reads all the 1D data (with the same length) into a DataFrame

    read_nc(file::String, selections::Vector{String} = varname_nc(file))

Read the selected variables from a netcdf file as a DataFrame, given
- `file` Path of the netcdf dataset
- `selections` Variables to read from the file

---
# Examples
```julia
df = read_nc("test.nc");
df = read_nc("test.nc", ["A", "B"]);
```
"""
read_nc(file::String, selections::Vector{String} = varname_nc(file)) = (
    _dims = [size_nc(file, _var)[1] for _var in selections];
    _lens = [size_nc(file, _var)[2][1] for _var in selections];
    @assert all(_dims .== 1) "All variables need to be 1D!";
    @assert all(_lens .== _lens[1]) "Dimensions of the variables need to be the same!";

    return DataFrame( [Pair(_var, read_nc(file, _var)) for _var in selections] )
);
