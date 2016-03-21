#!/usr/bin/env bash
set -e

app=$1
key=$2

node $HP4T_EXTENSION_DIR/src/export.js $app $key
