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

# You have to create this file and put it in proper directory
scripts/migrate-database.sh $1
