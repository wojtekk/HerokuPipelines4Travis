#!/usr/bin/env bash
set -e

HP4T_EXTENSION_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../../herokupipelines4travis/" && pwd )"

app=$1
key=$2

node $HP4T_EXTENSION_DIR/src/heroku/export.js $app $key
