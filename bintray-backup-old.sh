#!/bin/bash
source lib/functions.sh
setup_legacy
which brew
brew --version

# Download and backup
formulae="apache-arrow cairo ffmpeg freetype gdal gpgme gsl harfbuzz hiredis imagemagick@6 jq libarchive libgit2 libpq librsvg libsodium libssh mariadb-connector-c opencv openssl@1.1 poppler protobuf redland unixodbc v8 webp zeromq"
biglist=""
for f in $formulae; do
  deps=$(brew deps --include-build $f)
  biglist="$biglist $f $deps"
  echo "Adding $f and $deps"
done
alldeps=$(echo -e "${biglist// /\\n}" | sort -u)
echo $alldeps

# Get the bottle URLs
bottles=$(brew info --json=v1 $alldeps | jq -r '.[].bottle.stable.files | .high_sierra.url, .el_capitan.url')

# Download everything
echo $bottles
mkdir -p bintray
cd bintray
for url in $bottles; do
  if test -f "$(basename $url)"; then
    echo "$(basename $url) already exists."
    continue
  fi
  if [[ $url == *"bottles/llvm-"* ]]; then
    echo "Skipping LLVM (too large for github)"
    continue
  fi
  if [[ $url == *"bintray"* ]]; then
    echo "Downloading $url"
    curl -sSOLf "$url"
    echo "$url" >> bottles.txt
  fi
done
