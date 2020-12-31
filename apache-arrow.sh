#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Prepare homebrew
brew update
brew tap autobrew/cran
deploy_new_bundles apache-arrow-static
deploy_old_bundles apache-arrow
