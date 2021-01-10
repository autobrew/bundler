#!/bin/sh
SCRIPT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PATH="$SCRIPT/bin:$PATH"
export PKG_CONFIG_PATH="$SCRIPT/lib/pkgconfig"
export PROJ_LIB="$SCRIPT/share/proj"
