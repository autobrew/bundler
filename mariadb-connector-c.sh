#!/bin/sh
source lib/functions.sh
source ~/.Renviron

export package="mariadb-connector-c"
deploy_new_bundles mariadb-connector-c-static
deploy_old_bundles mariadb-connector-c
