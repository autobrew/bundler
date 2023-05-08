#!/bin/sh
source lib/functions.sh
deploy_new_bundles libssh
merge_universal_bundles libssh
deploy_old_bundles libssh