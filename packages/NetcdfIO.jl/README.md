# NetcdfIO.jl

NetcdfIO contains a number of wrapper functions for NCDatasets.jl. The use of these functions significantly reduce the number of code to read/write data from/to a netcdf file. Note that NetcdfIO does not have HDF4 support; if you need to open HDF4 files, use `NetCDF` v0.10 or `NCDatasets` v0.10 on a old system (for example, our server has a netcdf v4.3.3.1 installed, and it works; my desktop has a netcdf v4.8.1 installed, but it does not work).
