#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Source API key and publish
brew update
export package=gdal
export gdal_extra_files="*/*/share/gdal"
export gdal_lite_extra_files="*/*/share/gdal"
export proj_extra_files="*/*/share/proj"
export pkg_config_files="*/*/bin/pkg-config"
export deps="pkg-config minizip2 szip bzip2 librttopo openssl@1.1 geos udunits json-c freexl webp unixodbc expat openjpeg netcdf hdf5 giflib jpeg libgeotiff libpng libpq zstd xz libspatialite sqlite proj libtiff libtool libdap pcre"
deploy_new_bundles gdal-lite
deploy_sierra_bundle gdal
