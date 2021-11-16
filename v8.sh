#!/bin/sh
source lib/functions.sh

# Prepare homebrew
brew update
brew tap autobrew/cran
export package="v8"
export deps=""
deploy_new_bundles v8-static
