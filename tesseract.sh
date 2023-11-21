#!/bin/sh
source lib/functions.sh
export deps="giflib jpeg-turbo leptonica libpng libtiff little-cms2 openjpeg webp libarchive libb2 lz4 xz zstd"
export tesseract_extra_files="**/share/tessdata"
deploy_new_bundles tesseract
merge_universal_bundles tesseract
