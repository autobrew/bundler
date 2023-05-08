#!/bin/sh
source lib/functions.sh
deploy_new_bundles jq
merge_universal_bundles jq
deploy_old_bundles jq
