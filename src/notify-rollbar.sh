#!/usr/bin/env bash
set -e

# Gather information
AUTHOR=$(git --no-pager show -s --format='%an')
DESCRIPTION=$(git log --format=%B $TRAVIS_COMMIT_RANGE)

# Notify Rollbar
curl --data "access_token=$HP4T_ROLLBAR_DEPLOY_KEY&environment=production&revision=$TRAVIS_COMMIT" \
  --data-urlencode "comment=$DESCRIPTION" --data-urlencode "local_username=$AUTHOR" \
  https://api.rollbar.com/api/1/deploy/
