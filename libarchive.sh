#!/bin/sh
source lib/functions.sh
deploy_new_bundles libarchive
merge_universal_bundles libarchive
deploy_old_bundles libarchive
