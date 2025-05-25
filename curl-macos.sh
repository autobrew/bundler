#!/bin/sh
export deployment="big_sur"
source lib/functions.sh
export deps=""
deploy_new_bundles curl-macos
merge_universal_bundles curl-macos
