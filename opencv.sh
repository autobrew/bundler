#!/bin/sh
source lib/functions.sh

# Source API key and publish
export package="opencv"
export deps="jpeg libpng libtiff tbb webp"
export opencv_extra_files="**/share/opencv4"
export opencv_static_extra_files="**/share/opencv4"
deploy_old_bundles opencv
deploy_new_bundles opencv-static
