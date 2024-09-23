#!/bin/sh
source lib/functions.sh
export package=libgit2
export deps="libssh2 openssl@3"
#deploy_linux_bundles libgit2-static
deploy_new_bundles libgit2-static
merge_universal_bundles libgit2
