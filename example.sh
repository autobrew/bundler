#!/bin/sh
source functions.sh

# Prepare homebrew
brew update
brew tap autobrew/cran

# Source API key and publish
source ~/.Renviron
deploy_all_bundles apache-arrow-static
deploy_all_bundles v8-static
