#!/bin/sh
source lib/functions.sh
export package="libopenmpt"
#export deps="autobrew/cran/libsndfile flac libogg lame libvorbis mpg123 opus pcre2 portaudio"
deploy_new_bundles libopenmpt
merge_universal_bundles libopenmpt
