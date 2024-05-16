#!/bin/sh
source lib/functions.sh
export deps="raptor rasqal libtool"
deploy_new_bundles redland
merge_universal_bundles redland
