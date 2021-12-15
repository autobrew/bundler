#!/bin/sh
source lib/functions.sh
export deps="openssl@1.1"
deploy_old_bundles libpq
deploy_new_bundles libpq
