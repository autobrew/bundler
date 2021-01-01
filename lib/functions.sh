#!/bin/sh
set -e

deploy_bundle() {
  local formula=$1
  local target=$2

  if [ -z $formula ]; then
  echo "Please specify a formula, e.g: $0 apache-arrow-static"
  exit 1
  fi

  # Lookup the bottles
  local version=$(brew info $formula --json=v1 | jq -r '.[0].versions.stable')
  local bottles=$(brew info --json=v1 $(brew deps $formula) $formula | jq -r ".[].bottle.stable.files.$target.url")

  # Homebrew openssl@1.1 becomes just "openssl" in bintay
  local package=$(echo $formula | cut -d'@' -f1)
  local bundle="$package-$version-$target"

  # Download and extract bottles
  rm -Rf "$bundle" "$bundle.tar.xz"
  mkdir -p "$bundle"
  for url in $bottles
  do
    local file=$(basename $url)
    curl -sSL $url -o $file
    tar xzf $file -C $bundle --strip 2 '**/include' '**/*.a' '*/*/.brew'
    rm -f $file
    echo "OK! $file"
  done

  # Create archive
  mv "$bundle/.brew" "$bundle/brew"
  tar cfJ "archive/$bundle.tar.xz" $bundle
  rm -Rf $bundle

  # Upload to bintray
  local template='{"name":"package","licenses":["Apache-2.0"],"vcs_url":"https://github.com/autobrew"}'
  curl -u${BINTRAY_AUTH} \
    -H "Content-Type: application/json" \
    -d "${template/package/$package}" \
    "https://api.bintray.com/packages/autobrew/$target"
  curl --fail -u${BINTRAY_AUTH} \
    -T "archive/$bundle.tar.xz" \
    "https://api.bintray.com/content/autobrew/$target/$package/$version/$bundle.tar.xz?publish=1&override=1"
}

deploy_new_bundles(){
  local formula=$1
  local targets="arm64_big_sur big_sur catalina"
  for target in $targets
  do
    echo "Deploying $formula for $target..."
    deploy_bundle $formula $target
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
  local formula=$1
  local targets="high_sierra el_capitan"
  for target in $targets
  do
    echo "Deploying $formula for $target..."
    deploy_bundle $formula $target
  done
}
