#!/bin/sh
source lib/functions.sh
export tesseract_extra_files="**/share/tessdata"
deploy_old_bundles tesseract
deploy_new_bundles tesseract