#!/bin/sh
source lib/functions.sh
source ~/.Renviron

# Prepare homebrew
brew update
brew tap autobrew/cran

export deps=""
export package=protobuf
export protobuf_extra_files="*/*/bin"
export protobuf_static_extra_files="*/*/bin"
deploy_new_bundles protobuf-static
deploy_old_bundles protobuf
