#!/bin/sh
source lib/functions.sh
customdeplist="glib-lite harfbuzz-lite gdk-pixbuf-static libpng freetype fontconfig pixman cairo gettext libffi pcre jpeg jpeg-turbo libtiff fribidi lzo pango zstd pcre2"
deps=$customdeplist deploy_new_bundles librsvg
merge_universal_bundles librsvg
