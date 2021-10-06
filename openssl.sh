#!/bin/sh
source lib/functions.sh

# Source API key and publish
brew update
deploy_new_bundles openssl
package="openssl" deploy_old_bundles "openssl@1.1"

