#!/bin/sh
source lib/functions.sh
deps=boost
deploy_new_bundles quantlib
merge_universal_bundles quantlib
