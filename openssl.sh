#!/bin/sh
source lib/functions.sh

# Source API key and publish
export package="openssl" 
deploy_old_bundles "openssl@1.1"
deploy_new_bundles "openssl@1.1"
