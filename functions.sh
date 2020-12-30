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
  local version=$(brew info $formula --json | jq -r '.[0].versions.stable')
  local bottles=$(brew info --json $(brew deps $formula) $formula | jq -r ".[].bottle.stable.files.$target.url")
  local bundle="$formula-$version-$target"

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
  tar cfJ "$bundle.tar.xz" $bundle
  rm -Rf $bundle

  # Upload to bintray
  local template='{"name":"formula","licenses":["Apache-2.0"],"vcs_url":"https://github.com/autobrew"}'
  curl -u${BINTRAY_AUTH} \
    -H "Content-Type: application/json" \
    -d "${template/formula/$formula}" \
    "https://api.bintray.com/packages/autobrew/$target"
  curl --fail -u${BINTRAY_AUTH} \
    -T "$bundle.tar.xz" \
    "https://api.bintray.com/content/autobrew/$target/$formula/$version/$bundle.tar.xz?publish=1&override=1"
}

deploy_all_bundles(){
  local formula=$1
  local targets="arm64_big_sur big_sur catalina"
  for target in $targets
  do
    echo "Deploying $formula for $target..."
    deploy_bundle $formula $target
  done
}
