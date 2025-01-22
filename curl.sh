#!/bin/sh
export deployment="big_sur"
source lib/functions.sh
export deps="openssl-static libnghttp2-static"
deploy_new_bundles curl-lite
merge_universal_bundles curl
