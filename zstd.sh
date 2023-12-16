#!/bin/sh
source lib/functions.sh
export package=zstd
export zstd_static_extra_files="*/*/bin"
deploy_new_bundles zstd-static
merge_universal_bundles zstd
