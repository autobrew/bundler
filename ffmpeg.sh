#!/bin/sh
source lib/functions.sh
export package="ffmpeg"
deploy_new_bundles ffmpeg-lite
merge_universal_bundles ffmpeg
deploy_old_bundles ffmpeg
