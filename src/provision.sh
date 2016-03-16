#!/usr/bin/env bash
set -e

export HP4T_EXTENSION_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../herokupipelines4travis/" && pwd )"

environment=$1

# Provision the app
if [ "$TRAVIS_NODE_PATH" ];
then
  $TRAVIS_NODE_PATH $HP4T_EXTENSION_DIR/src/provision.js $PWD/infrastructure/$environment.js
else
  node $HP4T_EXTENSION_DIR/src/provision.js $PWD/infrastructure/$environment.js
fi
