#!/bin/sh
source lib/functions.sh
export package="libopenmpt"
export deps="autobrew/cran/openmpt portaudio portaudiocpp libsndfile vorbisfile vorbis flac ogg opus mpg123 z"
deploy_new_bundles autobrew/cran/openmpt
merge_universal_bundles openmpt
