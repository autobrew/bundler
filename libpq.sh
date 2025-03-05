#!/bin/sh
source lib/functions.sh
export package="libpq"
export deps="openssl-static"
deploy_new_bundles libpq-static
merge_universal_bundles libpq
