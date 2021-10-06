#!/bin/sh
source lib/functions.sh

# Source API key and publish
brew update
export deps="raptor rasqal libtool"
deploy_new_bundles redland
deploy_old_bundles redland
