#!/bin/sh
source lib/functions.sh
export deps="libpng libtiff jpeg"
export package="ragg"
deploy_new_bundles freetype
merge_universal_bundles ragg
deploy_old_bundles freetype
