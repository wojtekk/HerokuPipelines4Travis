#!/usr/bin/env bash

HP4T_EXTENSION_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../herokupipelines4travis/" && pwd )"

node $HP4T_EXTENSION_DIR/src/heroku/export.js $1
