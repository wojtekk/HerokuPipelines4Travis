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

# ==================== Install Heroku Toolbelt ====================

# You can install Heroku Toolbelt in .travis.yml
# addons:
#  apt:
#    sources:
#     - heroku
#    packages:
#     - heroku-toolbelt

if command -v heroku 2>/dev/null; then
  echo "Heroku Toolbelt Installed"
else
  echo "Install Heroku Toolbelt"
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
  heroku plugins:install heroku-pipelines
fi;

# ==================== Setup Heroku ====================

# Heroku git credentials
echo "Setup Heroku git"
netrc_content="machine git.heroku.com\n  login git\n  password $HEROKU_API_KEY"
echo -e $netrc_content >> ~/.netrc
