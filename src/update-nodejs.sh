#!/usr/bin/env bash
set -e

# ==================== Update NodeJS ====================

# Temporary solution - for PHP projects Travis CI has NodeJS v0.10 without Promises :/
# Additional environment variables in .travis.yml:
#  - TRAVIS_NODE_VERSION
# and command ~/npm/.bin/npm install in .travis.yml

node_version=$(node --version | tr -d [:alpha:] | cut -c1)

if [ "$node_version" -le 4 ];
then
  echo "Install NodeJS 4.1.2 - your version is too old"
  rm -rf ~/.nvm
  git clone https://github.com/creationix/nvm.git ~/.nvm
  (cd ~/.nvm && git checkout `git describe --abbrev=0 --tags`)
  source ~/.nvm/nvm.sh &>/dev/null
  nvm install 4.1.2
  npm install npm
  mv node_modules ~/npm
  ~/npm/.bin/npm install
else
  npm install # TODO Move to .travis.yml#install
fi
