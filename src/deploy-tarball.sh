#!/usr/bin/env bash
set -e

package=$1
app=$2

node $HP4T_EXTENSION_DIR/src/deploy-tarball.js $package $app --api-key=$HEROKU_API_KEY
