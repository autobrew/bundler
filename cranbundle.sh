#!/bin/sh
source lib/functions.sh
export package=cranbundle
export gdal_extra_files="*/*/share/gdal"
export gdal_lite_extra_files="*/*/share/gdal"
export proj_extra_files="*/*/share/proj"
export pkg_config_files="*/*/bin/pkg-config"
export protobuf_extra_files="*/*/bin/protoc"
export gsl_extra_files="*/*/bin/gsl-config"
export hdf5_extra_files="*/*/bin/h5cc */*/bin/h5c++ */*/share/hdf5"
export netcdf_extra_files="*/*/bin/nc-config */*/bin/ncxx4-config"
export fftw_extra_files="*/*/lib/pkgconfig"
export cmake_files="*/*/bin/cmake"
export cmake_extra_files="*/*/share/cmake"
export libpng_extra_files="*/*/bin/*-config"
export deps="cmake fftw mpfr pcre2 protobuf gmp gsl glpk pkg-config minizip2 szip bzip2 librttopo openssl@1.1 geos udunits json-c freexl webp unixodbc expat openjpeg netcdf hdf4 hdf5 giflib jpeg libgeotiff libpng libpq zstd xz libspatialite sqlite proj libtiff libtool libdap pcre"
deploy_old_bundles gdal
deploy_new_bundles gdal-lite
