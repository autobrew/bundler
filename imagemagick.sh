#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Source API key and publish
brew update
export package=imagemagick
deplist="libtool librsvg libpng freetype fontconfig pixman cairo gettext libffi pcre jpeg libtiff fribidi pango libffi little-cms2 openjpeg webp"
deps="glib-lite harfbuzz-lite gdk-pixbuf-static $deplist" deploy_new_bundles "imagemagick-static"
deps="harfbuzz gdk-pixbuf $deplist" deploy_old_bundles "imagemagick@6"
