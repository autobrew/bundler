#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Source API key and publish
brew update
export package=imagemagick
deplist="libheif libde265 x265 jasper libtool librsvg libpng freetype fontconfig pixman cairo gettext libffi pcre jpeg libtiff fribidi pango libffi little-cms2 openjpeg webp"
deps="libraw-lite glib-lite harfbuzz-lite gdk-pixbuf-static $deplist" deploy_new_bundles "imagemagick-static"
deps="libraw glib harfbuzz gdk-pixbuf $deplist" deploy_old_bundles "imagemagick@6"
