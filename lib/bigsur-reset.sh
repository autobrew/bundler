#!/bin/sh
set -e
brew update

# Reset homebrew-core
cd $(brew --repo homebrew/core)
git clean -fxd
git remote set-url origin https://github.com/autobrew/homebrew-big-sur
git fetch origin master
git reset --hard origin/master

#cd $(brew --repo homebrew/core)
#git clean -fxd
#git reset --hard ea58a1bda7cdbc237877ed99176a29b8dfc179dc
#git branch bigsur
#git checkout bigsur
#git remote remove origin

# brew itself
#cd $(brew --repo)
#git clean -fxd
#git reset --hard ae5e9387b95c81a7247068053a013339a6fc7762
#git branch bigsur
#git checkout bigsur
#git remote remove origin

GITHUB_ENV="${GITHUB_ENV:-/dev/stderr}"
echo "HOMEBREW_NO_GITHUB_API=1" >> "$GITHUB_ENV"
echo "HOMEBREW_NO_INSTALL_FROM_API=1" >> "$GITHUB_ENV"
echo "HOMEBREW_NO_AUTO_UPDATE=1" >> "$GITHUB_ENV"
