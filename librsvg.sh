#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Source API key and publish
brew update
customdeplist="glib-lite harfbuzz-lite gdk-pixbuf-static libpng freetype fontconfig pixman cairo gettext libffi pcre jpeg libtiff fribidi lzo pango"
deps=$customdeplist deploy_new_bundles librsvg
deploy_old_bundles librsvg
