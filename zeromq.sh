#!/bin/sh
source lib/functions.sh

# Source API key and publish
brew update
deploy_new_bundles zeromq
deploy_old_bundles zeromq
