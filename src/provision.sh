#!/usr/bin/env bash
set -e

environment=$1

# Provision the app

if [ "$TRAVIS_NODE_PATH" ];
then
  $TRAVIS_NODE_PATH $HP4T_EXTENSION_DIR/src/provision.js $PWD/infrastructure/$environment.js
else
  node $HP4T_EXTENSION_DIR/src/provision.js $PWD/infrastructure/$environment.js
fi
