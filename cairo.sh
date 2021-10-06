#!/bin/sh
source lib/functions.sh

# Prepare homebrew
brew update

# Use default cairo, except do not bundle the 'glib' dependency
deps="fontconfig freetype libpng lzo pixman" deploy_new_bundles cairo
deploy_old_bundles cairo
