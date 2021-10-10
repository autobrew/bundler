#!/bin/sh
source lib/functions.sh

# Source API key and publish
brew update
export package=cranbundle
export gdal_extra_files="*/*/share/gdal"
export gdal_lite_extra_files="*/*/share/gdal"
export proj_extra_files="*/*/share/proj"
export pkg_config_files="*/*/bin/pkg-config"
export protobuf_extra_files="*/*/bin/protoc"
export gsl_extra_files="*/*/bin/gsl-config"
export hdf5_extra_files="*/*/bin/h5cc */*/bin/h5c++ */*/share/hdf5"
export netcdf_extra_files="*/*/bin/nc-config */*/bin/ncxx4-config"
export deps="mpfr pcre2 protobuf gmp gsl glpk pkg-config minizip2 szip bzip2 librttopo openssl@1.1 geos udunits json-c freexl webp unixodbc expat openjpeg netcdf hdf4 hdf5 giflib jpeg libgeotiff libpng libpq zstd xz libspatialite sqlite proj libtiff libtool libdap pcre"

# Bundles for new platforms, including arm64 (untested)
brew tap autobrew/cran
deploy_new_bundles gdal-lite
deploy_sierra_bundle gdal


