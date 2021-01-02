#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Source API key and publish
brew update
#deploy_new_bundles redland raptor rasqal libtool
deploy_old_bundles redland raptor rasqal libtool
