# Submodules of JuliaUtilities

- `ConstrainedRootSolvers` contains algorithms for root finding often do not work for plants because of the wierd shape of curves. In many cases, chosing a good initial guess works. But in many case,
    the initial guess may result in error. Here, customized root finding algorithms are presented with constaints.
- `EmeraldMath` contains the supplemental math functions
- `EmeraldRegression` contains the code to run linear regression using `GML.jl`
- `NetcdfIO` contains a number of wrapper functions for NCDatasets.jl. The use of these functions significantly reduce the number of code to read/write data from/to a netcdf file. Note that NetcdfIO
    does not have HDF4 support; if you need to open HDF4 files, use `NetCDF` v0.10 or `NCDatasets` v0.10 on a old system (for example, our server has a netcdf v4.3.3.1 installed, and it works; my
    desktop has a netcdf v4.8.1 installed, but it does not work).
- `PkgUtility` includes a collection of utility functions.
- `PlotPlants` includes a collection of customized plotting utilities to aid the plotting using `PyPlot` package.
- `TextIO` contains wrapper functions to conveniently read and save text files.
