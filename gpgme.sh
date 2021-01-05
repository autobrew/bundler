#!/bin/sh
source lib/functions.sh
source ~/.Renviron

export deps="libgpg-error libassuan gnupg@1.4"
export gnupg_1_4_files="*/*/bin/gpg1"
deploy_new_bundles gpgme
deploy_old_bundles gpgme
