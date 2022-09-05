#!/bin/sh
source lib/functions.sh
export package=libgit2
deploy_linux_bundles libgit2-static
deploy_new_bundles libgit2-static
deploy_old_bundles libgit2
