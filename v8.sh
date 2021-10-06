#!/bin/sh
source lib/functions.sh

# Prepare homebrew
brew update
brew tap autobrew/cran
export package="v8"
deploy_new_bundles v8-static
deploy_old_bundles v8
