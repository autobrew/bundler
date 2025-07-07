#!/bin/sh
source lib/functions.sh

# Source API key and publish
export package="libxml2" 
deploy_new_bundles "libxml2-static"
merge_universal_bundles libxml2
