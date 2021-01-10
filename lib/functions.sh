#!/bin/sh
set -e

deploy_bundle() {
  local target=$1
  local formula=$2

  if [ -z "$formula" ]; then
  echo "Please specify a formula, e.g: $0 apache-arrow-static"
  exit 1
  fi

  if [ -z ${deps+set} ]; then
  local deps="$(brew deps $formula)"
  fi

  # Print debug
  echo "Deploying $formula for $target with deps: $deps"

  # Lookup the bottles
  local version=$(brew info $formula --json=v1 | jq -r '.[0].versions.stable')
  local bottles=$(brew info --json=v1 $deps $formula | jq -r ".[].bottle.stable.files.$target.url")
  echo "Bundling bottles:\n$bottles"

  # Homebrew openssl@1.1 becomes just "openssl" in bintay
  if [ -z "$package" ]; then
  local package=$(echo $formula | cut -d'@' -f1)
  fi
  local bundle="$package-$version-$target"
  echo "Creating bundle $bundle"

  # Download and extract bottles
  rm -Rf "$bundle" "$bundle.tar.xz"
  mkdir -p "$bundle"
  for url in $bottles
  do
    local file=$(basename $url)
    local current="${file%-*}"
    local sharevar="${current//-/_}_extra_files"
    curl -sSL $url -o $file
    if tar -tf $file '*/*/.brew' >/dev/null; then
      local brewvar='*/*/.brew'
    else
      unset brewvar && echo "NOTE: missing .brew in $file"
    fi
    if [[ $current == "gnupg"* ]]; then
      tar xzf $file -C $bundle --strip 2 ${brewvar} '**/bin/gpg1'
    else
      tar xzf $file -C $bundle --strip 2 '**/include' '**/*.a' ${brewvar} ${!sharevar}
    fi
    rm -f $file
    echo "OK! $file"
  done

  # Copy custom files if any
  if [ -d "${package}-files" ]; then
    cp -Rf ${package}-files/* $bundle/
  fi

  # Create archive
  mv "$bundle/.brew" "$bundle/brew" || true
  brew deps --tree $formula > $bundle/tree.txt
  mkdir -p archive
  tar cfJ "archive/$bundle.tar.xz" $bundle
  rm -Rf $bundle

  #Upload to bintray
  local template='{"name":"package","licenses":["Apache-2.0"],"vcs_url":"https://github.com/autobrew"}'
  curl -u${BINTRAY_AUTH} \
    -H "Content-Type: application/json" \
    -d "${template/package/$package}" \
    "https://api.bintray.com/packages/autobrew/$target"
  curl --fail -u${BINTRAY_AUTH} \
    -T "archive/$bundle.tar.xz" \
    "https://api.bintray.com/content/autobrew/$target/$package/$version/$bundle.tar.xz?publish=1&override=1"
  echo "\nUpload OK: $bundle.tar.xz!"
}

deploy_new_bundles(){
  jq --version || brew install jq
  local targets="arm64_big_sur big_sur catalina"
  for target in $targets
  do
    deploy_bundle $target "${@:1}"
  done
}

setup_legacy(){
  local BREWDIR="$PWD/autobrew"
  #export HOMEBREW_TEMP="$AUTOBREW/hbtmp"
  if [ ! -f "$BREWDIR/bin/brew" ]; then
    mkdir -p $BREWDIR
    curl -fsSL https://github.com/autobrew/brew/tarball/master | tar xz --strip 1 -C $BREWDIR
  fi
  # Test installing a package
  export PATH="$BREWDIR/bin:$PATH"
  brew install --force-bottle pkg-config
}

deploy_old_bundles(){
  setup_legacy
  local targets="high_sierra el_capitan"
  for target in $targets
  do
    deploy_bundle $target "${@:1}"
  done
}
