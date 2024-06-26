#!/bin/sh
source lib/functions.sh
export package=cranbundle
export gdal_extra_files="*/*/share/gdal"
export gdal_lite_extra_files="*/*/share/gdal"
export proj_extra_files="*/*/share/proj */*/lib/pkgconfig"
export pkg_config_files="*/*/bin/pkg-config"
export protobuf_extra_files="*/*/bin/protoc*"
export protobuf_static_extra_files="*/*/bin/protoc*"
export gsl_extra_files="*/*/bin/gsl-config"
export hdf5_extra_files="*/*/bin/h5cc */*/bin/h5c++ */*/share/hdf5"
export netcdf_extra_files="*/*/bin/nc-config"
export fftw_extra_files="*/*/lib/pkgconfig"
export cmake_files="*/*/bin/cmake"
export cmake_extra_files="*/*/share/cmake"
export libpng_extra_files="*/*/lib/pkgconfig"
export cairo_extra_files="*/*/lib/pkgconfig/cairo.pc"
export pixman_extra_files="*/*/lib/pkgconfig"
export fontconfig_extra_files="*/*/lib/pkgconfig"
export freetype_extra_files="*/*/lib/pkgconfig"
export libtiff_extra_files="*/*/lib/pkgconfig"
export deps="cairo fontconfig freetype pixman cmake fftw mpfr pcre2 protobuf-static gmp gsl glpk pkg-config minizip2 libaec bzip2 lz4 librttopo openssl@1.1 geos udunits json-c freexl webp unixodbc expat openjpeg netcdf hdf4 hdf5 giflib jpeg libgeotiff libpng libpq zstd xz libspatialite sqlite proj libtiff libtool libdap pcre"
deploy_new_bundles gdal-lite
merge_universal_bundles cranbundle
