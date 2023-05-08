#!/bin/sh
source lib/functions.sh
deploy_new_bundles zeromq
merge_universal_bundles zeromq
deploy_old_bundles zeromq
