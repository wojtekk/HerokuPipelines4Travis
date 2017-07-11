#!/usr/bin/env bash
set -e

output=$1

$(npm bin)/bundle-deps
if [ -f "yarn.lock" ]; then
  yarn install --prefer-offline --no-progress # refresh checksume in yarn.lock - important for heroku
fi
PACKAGE=$(npm pack)

$(npm bin)/tar-rename package "" -s $PACKAGE -o $output
