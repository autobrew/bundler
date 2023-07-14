#!/bin/sh
source lib/functions.sh

# Source API key and publish
export package="openssl" 
deploy_new_bundles "openssl-static"
merge_universal_bundles openssl
deploy_old_bundles "openssl@1.1"
