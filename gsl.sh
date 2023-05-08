#!/bin/sh
source lib/functions.sh
deploy_new_bundles gsl
merge_universal_bundles gsl
deploy_old_bundles gsl