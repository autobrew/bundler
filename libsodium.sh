#!/bin/sh
source lib/functions.sh

# Source API key and publish
brew update
deploy_new_bundles libsodium
deploy_old_bundles libsodium
