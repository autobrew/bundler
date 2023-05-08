#!/bin/sh
source lib/functions.sh
deploy_new_bundles unixodbc
merge_universal_bundles unixodbc
deploy_old_bundles unixodbc
