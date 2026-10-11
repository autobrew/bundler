#!/bin/sh
source lib/functions.sh
export deps=""
deploy_new_bundles libgit2-macos
merge_universal_bundles libgit2-macos
