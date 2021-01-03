#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Prepare homebrew
brew update

# The 'textshaping' pkg only needs harfbuzz, freetype, fribidi, png
# But we add the others for when ppl use harfbuzz-cairo
# We also built with glib bindings but not adding that here
export deps="cairo fontconfig freetype libpng lzo pixman fribidi"
deploy_new_bundles harfbuzz
deploy_old_bundles harfbuzz
