#!/bin/sh
source lib/functions.sh
export package="v8"
export deps=""
deploy_new_bundles v8-static
merge_universal_bundles v8
