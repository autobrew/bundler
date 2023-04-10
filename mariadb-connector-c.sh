#!/bin/sh
source lib/functions.sh
export package="mariadb-connector-c"
deploy_new_bundles mariadb-connector-c-static
merge_universal_bundles mariadb-connector-c
deploy_old_bundles mariadb-connector-c
