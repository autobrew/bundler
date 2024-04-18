#!/bin/sh
source lib/functions.sh
export deps="openssl@3"
deploy_new_bundles libpq
merge_universal_bundles libpq
