#!/bin/sh
source lib/functions.sh
export package="ffmpeg"
deploy_old_bundles ffmpeg
deploy_new_bundles ffmpeg-lite
