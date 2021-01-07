#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Source API key and publish
brew update
deploy_new_bundles libarchive
deploy_old_bundles libarchive
