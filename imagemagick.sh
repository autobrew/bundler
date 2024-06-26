#!/bin/sh
source lib/functions.sh
export package=imagemagick
deplist="libheif libde265 x265 jasper libtool librsvg libpng freetype fontconfig pixman cairo gettext libffi pcre jpeg libtiff fribidi pango libffi little-cms2 openjpeg webp"
deps="pcre2 zstd aom-lite libraw-lite glib-lite harfbuzz-lite gdk-pixbuf-static $deplist" deploy_new_bundles "imagemagick-static"
merge_universal_bundles imagemagick
