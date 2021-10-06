#!/bin/sh
source lib/functions.sh

# Prepare homebrew
brew update
brew tap autobrew/cran
export package="ffmpeg"
deploy_new_bundles ffmpeg-lite
deploy_old_bundles ffmpeg

