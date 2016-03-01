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

# Gather information
AUTHOR=$(git --no-pager show -s --format='%an')
DESCRIPTION=$(git log --format=%B $TRAVIS_COMMIT_RANGE)

# Notify Rollbar
curl --data "access_token=$HP4T_ROLLBAR_DEPLOY_KEY&environment=production&revision=$TRAVIS_COMMIT" \
  --data-urlencode "comment=$DESCRIPTION" --data-urlencode "local_username=$AUTHOR" \
  https://api.rollbar.com/api/1/deploy/
