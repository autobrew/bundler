#!/bin/sh
source lib/functions.sh

# Use default cairo, except do not bundle the 'glib' dependency
deps="fontconfig freetype libpng lzo pixman libpng" deploy_new_bundles cairo
merge_universal_bundles cairo

