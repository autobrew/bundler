#!/bin/sh
source lib/functions.sh
deploy_new_bundles libsodium
merge_universal_bundles libsodium
deploy_old_bundles libsodium