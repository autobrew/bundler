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
  echo "Bundling $formula for $target with deps: $deps"

  # Lookup the bottles
  local deptree=$(brew deps --tree $formula)
  local version=$(brew info $formula --json=v1 | jq -r '.[0].versions.stable')
  local revision=$(brew info $formula --json=v1 | jq -r '.[0].revision')
  if [ "$revision" != "0" ]; then
  version="${version}_$revision"
  fi
  if [ "$package" == "cranbundle" ]; then
  version="$(date +'%Y%m%d')"
  fi

  # Find bottle URLs
  local bottles=$(brew info --json=v1 $deps $formula | jq -r ".[] | .name + \";\" + .bottle.stable.files.$target.url")
  echo "Found bottles:\n$bottles"

  # Homebrew openssl@1.1 becomes just "openssl" in bintay
  if [ -z "$package" ]; then
  local package=$(echo $formula | cut -d'@' -f1)
  fi

  local bundle="$package-$version-$target"
  echo "Creating bundle $bundle"

  # Download and extract bottles
  set -f
  rm -Rf "$bundle" "$bundle.tar.xz"
  mkdir -p "$bundle"
  for bottle in $bottles
  do
    local current=$(echo "$bottle" | cut -d';' -f1)
    local url=$(echo "$bottle" | cut -d';' -f2)
    if [[ $url == *"ghcr.io"* ]]; then
      local file="${current}_${target}.tar.gz"
    else
      local file=$(basename $url)
    fi
    local filesvar="${current//-/_}_files"
    local sharevar="${current//-/_}_extra_files"
    local addfiles='**/include **/*.a'
    if [ ${!filesvar} ]; then
      local addfiles=${!filesvar}
    fi

    #local includevar="${current//-/_}_include_files"
    curl -fsSL --header "Authorization: Bearer QQ==" $url -o $file
    if tar -tf $file '*/*/.brew' >/dev/null; then
      local brewvar='*/*/.brew'
    else
      unset brewvar && echo "NOTE: missing .brew in $file"
    fi
    # Shipping all pc files may overrule autobrew...
    #if [ "$package" == "cranbundle" ] && tar -tf $file '**/*.pc' 2>/dev/null; then
    #  brewvar='**/*.pc'
    #fi
    if [[ $current == "gnupg"* ]]; then
      tar xzf $file -C $bundle --strip 2 ${brewvar} '**/bin/gpg1'
    else
      tar xzf $file -C $bundle --strip 2 ${addfiles} ${brewvar} ${!sharevar}
    fi
    rm -f $file
    echo "OK! $file"
  done
  set +f

  # Copy custom files if any
  if [ -d "${package}-files" ]; then
    cp -Rf ${package}-files/* $bundle/
  fi

  # Replaces homebrew paths with /usr/local
  if [ "$package" == "cranbundle" ]; then
    sed -i '' 's|@@HOMEBREW_.[A-Z]*@@/[^/"]*/[^/"]*|/usr/local|g' ${bundle}/bin/{gsl,h5,nc}*
  fi

  # Create archive
  mv "$bundle/.brew" "$bundle/brew" || true
  echo "$deptree" > $bundle/tree.txt
  echo "$bottles" > $bundle/bottles.txt
  mkdir -p "archive/$target"
  tar cfJ "archive/$target/$bundle.tar.xz" $bundle
  rm -Rf $bundle

  #Upload to bintray
  #if [ -z "$DRYRUN" ];then
  #  local template='{"name":"package","licenses":["Apache-2.0"],"vcs_url":"https://github.com/autobrew"}'
  #  curl -u${BINTRAY_AUTH} \
  #    -H "Content-Type: application/json" \
  #    -d "${template/package/$package}" \
  #    "https://api.bintray.com/packages/autobrew/$target"
  #  curl --fail -u${BINTRAY_AUTH} \
  #    -T "archive/$target/$bundle.tar.xz" \
  #    "https://api.bintray.com/content/autobrew/$target/$package/$version/$bundle.tar.xz?publish=1&override=1"
  #  echo "\nUpload OK: $bundle.tar.xz!"
    # curl --fail -u${JFROG_AUTH} \
    #   -T "archive/$target/$bundle.tar.xz" \
    #   "https://autobrew.jfrog.io/artifactory/$target/$bundle.tar.xz?publish=1&overrideExistingFiles=1"
  #fi
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

# Temporary solution to use devel branch for autobrew/core
setup_legacy_sierra(){
  local BREWDIR="$PWD/sierrabrew"
  #export HOMEBREW_TEMP="$AUTOBREW/hbtmp"
  export PATH="$BREWDIR/bin:$PATH"
  if [ ! -f "$BREWDIR/bin/sierrabrew" ]; then
    mkdir -p $BREWDIR
    curl -fsSL https://github.com/autobrew/brew/tarball/master | tar xz --strip 1 -C $BREWDIR
    brew install --force-bottle pkg-config
    (cd $(brew --repo homebrew/core); git fetch origin devel:refs/remotes/origin/devel; git reset --hard origin/devel; git log -n1)
  fi
}

deploy_sierra_bundle(){
  setup_legacy_sierra
  deploy_bundle "high_sierra" "${@:1}"
}

