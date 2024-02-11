#!/bin/sh
source lib/functions.sh
export package="fluid-synth"
export deps="autobrew/cran/libsndfile flac glib lame libogg libvorbis mpg123 opus pcre2 portaudio"
deploy_new_bundles autobrew/cran/fluid-synth
merge_universal_bundles fluid-synth
