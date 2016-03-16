#!/usr/bin/env bash
set -e

# Allow deploy only from specified repository and branch but not from pull requests
if [ "$TRAVIS_REPO_SLUG" != "$HP4T_DEPLOY_FROM_REPOSITORY" ] || \
  [ "$TRAVIS_BRANCH" != "$HP4T_DEPLOY_FROM_BRANCH" ] || \
  [ "$TRAVIS_PULL_REQUEST" != false ]
then
  echo "-- Skipped"
  exit 0;
fi

export HP4T_EXTENSION_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../herokupipelines4travis/" && pwd )"

environment=$1

# Provision the app
if [ "$TRAVIS_NODE_PATH" ];
then
  $TRAVIS_NODE_PATH $HP4T_EXTENSION_DIR/src/heroku/provision.js $PWD/infrastructure/$environment.js
else
  node $HP4T_EXTENSION_DIR/src/heroku/provision.js $PWD/infrastructure/$environment.js
fi
