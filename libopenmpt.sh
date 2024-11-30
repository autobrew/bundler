#!/bin/sh
source lib/functions.sh
export package="libopenmpt"
#export deps="autobrew/cran/openmpt portaudio portaudiocpp libsndfile vorbisfile vorbis flac ogg opus mpg123 z"
deploy_new_bundles libopenmpt
merge_universal_bundles libopenmpt
