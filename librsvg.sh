#!/bin/sh
source lib/functions.sh
export package="librsvg"
export deps="cairo-lite pango-lite glib-lite harfbuzz-lite gdk-pixbuf-static libpng freetype pixman gettext libffi pcre jpeg-turbo libtiff fribidi lzo zstd pcre2"
deploy_new_bundles librsvg-lite
merge_universal_bundles librsvg
