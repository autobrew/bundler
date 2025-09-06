#!/bin/sh
source lib/functions.sh

# Source API key and publish
export package="opencv"
export deps="jpeg-turbo libpng libtiff tbb webp protobuf zstd"
export opencv_extra_files="**/share/opencv4"
export opencv_static_extra_files="**/share/opencv4"
deploy_new_bundles opencv-static
merge_universal_bundles opencv
