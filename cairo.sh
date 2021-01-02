#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Prepare homebrew
brew update

# Use default cairo, except do not bundle the 'glib' dependency
deploy_new_bundles cairo fontconfig freetype libpng lzo pixman
deploy_old_bundles cairo
