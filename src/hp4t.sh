#!/usr/bin/env bash
set -e

# Read variables, helper functions and configurations

export COMMANDS_DIR="$(dirname $(readlink -f "${BASH_SOURCE[0]}"))"
. $COMMANDS_DIR/_variables.sh
. $COMMANDS_DIR/_helpers.sh
. $COMMANDS_DIR/_configuration.sh

# Check if command is allowed only on Travis. Safe commands can be run anywhere

commandName=$1
commandIsSafe=$( array_contains safeCommands "$commandName" && echo 1 || echo 0 )

# Allow deploy only from specified repository and branch but not from pull requests

if [[ "$commandIsSafe" != 1  &&  \
  ( "$TRAVIS_REPO_SLUG" != "$HP4T_DEPLOY_FROM_REPOSITORY"  || \
   "$TRAVIS_BRANCH" != "$HP4T_DEPLOY_FROM_BRANCH"  || \
   "$TRAVIS_PULL_REQUEST" != false ) ]]
then
  echo "-- Skipped"
  exit 0;
fi

# Run command and pass all params

command="$COMMANDS_DIR/$commandName.sh"
params="$(printf " %q" "${@:2}")"

bash -c "$command $params"
