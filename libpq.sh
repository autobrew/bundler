#!/bin/sh
source lib/functions.sh
export deps="openssl@1.1"
deploy_new_bundles libpq
merge_universal_bundles libpq
deploy_old_bundles libpq