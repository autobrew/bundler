#!/bin/sh
source lib/functions.sh
export package="libopenmpt"
export deps="autobrew/cran/libsndfile libopenmpt libvorbis libogg opus mpg123 portaudio"
deploy_new_bundles autobrew/cran/openmpt
merge_universal_bundles openmpt
