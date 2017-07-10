#!/usr/bin/env bash
set -e

output=$1

$(npm bin)/bundle-deps
PACKAGE=$(npm pack)

$(npm bin)/tar-rename package "" -s $PACKAGE -o $output
