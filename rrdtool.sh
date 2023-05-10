#!/bin/sh
source lib/functions.sh
export deps=""
deploy_new_bundles rrdtool
merge_universal_bundles rrdtool
deploy_old_bundles rrdtool
