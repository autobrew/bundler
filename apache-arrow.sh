#!/bin/sh
source lib/functions.sh
export package="apache-arrow"
deploy_new_bundles apache-arrow-static
merge_universal_bundles apache-arrow
