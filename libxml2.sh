#!/bin/sh
export deployment="big_sur"
source lib/functions.sh

export package="libxml2" 
deploy_new_bundles "libxml2-static"
merge_universal_bundles libxml2
