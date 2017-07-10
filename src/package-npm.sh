#!/usr/bin/env bash
set -e

output=$1

PACKAGE=$($(npm bin)/npm-bundle)
$(npm bin)/tar-rename package "" -s $PACKAGE -o $output
