#!/bin/bash
set -e

# Get portable ruby and clear bottles.txt
rm -Rf bintray 
mkdir -p bintray
cd bintray
rubyurl="https://homebrew.bintray.com/bottles-portable-ruby/portable-ruby-2.3.7.leopard_64.bottle.tar.gz"
curl -sSOLf "$rubyurl"
echo "$rubyurl" > bottles.txt
git init
git remote add origin https://github.com/autobrew/bintray-backup
git add .
git commit -a -m 'Backup portable ruby'
cd ..

# Get bottles from old branch
./bintray-backup-old.sh
cd bintray
rm -f gcc-8.2.0.el_capitan.bottle.1.tar.gz
git add *el_capitan*
git commit -a -m 'Backup el_capitan bottles'
git add .
git commit -a -m 'Backup high_sierra bottles'
cd ..

# Add bottles from new branch
./bintray-backup-new.sh
cd bintray
git add .
git commit -a -m 'Update high_sierra bottles'
cd ..
