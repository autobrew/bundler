#!/bin/sh
source lib/functions.sh

# Source API key and publish
brew update
export deps="libpng libtiff jpeg"
export package="ragg"
deploy_new_bundles freetype
deploy_old_bundles freetype
