#!/bin/sh
source lib/functions.sh

# Prepare homebrew
brew update
brew tap autobrew/cran

# Source API key and publish
source ~/.Renviron
deploy_all_bundles v8-static
