#!/usr/bin/env bash
set -e

NPM_OPTIONS=$1

npm install heroin-js@$HP4T_HEROIN_VERSION lodash@$HP4T_LODASH_VERSION $NPM_OPTIONS
