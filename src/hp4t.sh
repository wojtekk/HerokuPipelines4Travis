#!/usr/bin/env bash
set -e

# Safe commands don't affect production or stage environment
safeCommands=( "export" "update-nodejs" );

array_contains() {
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}
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

COMMAND_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../herokupipelines4travis/src/" && pwd )"

command="$COMMAND_DIR/$commandName.sh"
params="${@:2}"

$command $params
