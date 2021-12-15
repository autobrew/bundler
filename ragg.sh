#!/bin/sh
source lib/functions.sh
export deps="libpng libtiff jpeg"
export package="ragg"
deploy_old_bundles freetype
deploy_new_bundles freetype
