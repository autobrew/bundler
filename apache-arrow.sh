#!/bin/sh
source lib/functions.sh

# Prepare homebrew
export package="apache-arrow"
deploy_old_bundles apache-arrow
deploy_new_bundles apache-arrow-static

