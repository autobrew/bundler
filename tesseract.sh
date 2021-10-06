#!/bin/sh
source lib/functions.sh

# Source API key and publish
brew update
export tesseract_extra_files="**/share/tessdata"
deploy_new_bundles tesseract
deploy_old_bundles tesseract
