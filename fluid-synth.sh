#!/bin/sh
source lib/functions.sh
export package="fluid-synth"
export deps="libsndfile flac glib lame libogg libvorbis mpg123 opus pcre2 portaudio gettext"
deploy_new_bundles fluid-synth
merge_universal_bundles fluid-synth
