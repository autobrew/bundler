#!/bin/sh
source lib/functions.sh

# Source API key and publish
brew update
export deps="openssl@1.1"
deploy_new_bundles libpq
deploy_old_bundles libpq
