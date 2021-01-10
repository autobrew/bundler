#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Source API key and publish
brew update
export package=gdal
export gdal_lite_extra_files="*/*/share/gdal"
export proj_extra_files="*/*/share/proj"
export deps="minizip2 szip bzip2 librttopo openssl geos udunits json-c freexl webp unixodbc expat openjpeg netcdf hdf5 giflib jpeg libgeotiff libpng cfitsio libpq zstd xz libspatialite sqlite proj libtiff libtool libdap pcre"
deploy_new_bundles gdal-lite
#deploy_old_bundles gdal
