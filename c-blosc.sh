#!/bin/sh
export deps="zstd zlib lz4"
source lib/functions.sh
deploy_new_bundles c-blosc
merge_universal_bundles c-blosc
