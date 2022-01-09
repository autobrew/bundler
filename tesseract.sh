#!/bin/sh
source lib/functions.sh
export deps="giflib jpeg leptonica libpng libtiff little-cms2 openjpeg webp"
export tesseract_extra_files="**/share/tessdata"
deploy_old_bundles tesseract
deploy_new_bundles tesseract
