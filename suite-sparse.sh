#!/bin/sh
source lib/functions.sh
export deps="gmp mpfr" # maybe not needed
export package="suite-sparse"
deploy_new_bundles suite-sparse-static
merge_universal_bundles suite-sparse
