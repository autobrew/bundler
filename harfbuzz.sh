#!/bin/sh
source lib/functions.sh

# Prepare homebrew
brew update

# The 'textshaping' pkg only needs harfbuzz, freetype, fribidi, png
# But we add the others for when ppl use harfbuzz-cairo
# We also built with glib bindings but not adding that here
export package=harfbuzz
export deps="cairo fontconfig freetype libpng lzo pixman fribidi"
deploy_new_bundles harfbuzz-lite
deploy_old_bundles harfbuzz
