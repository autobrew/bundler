#!/bin/sh
source lib/functions.sh

# Avoid glib dependency (from cairo)
export deps="cairo fontconfig freetype libpng lzo pixman gettext jpeg-turbo openjpeg little-cms2 libtiff zstd"
export poppler_extra_files="**/share/poppler"
export poppler_lite_extra_files="**/share/poppler"
export package="poppler"
deploy_new_bundles poppler-lite
merge_universal_bundles poppler
