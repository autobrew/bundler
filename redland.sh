#!/bin/sh
source lib/functions.sh
export deps="raptor rasqal libtool"
deploy_old_bundles redland
deploy_new_bundles redland
