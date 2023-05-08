#!/bin/sh
source lib/functions.sh
deploy_new_bundles freetype
merge_universal_bundles freetype
deploy_old_bundles freetype
