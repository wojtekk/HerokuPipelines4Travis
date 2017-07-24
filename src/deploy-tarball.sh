#!/usr/bin/env bash
set -e

package=$1
app=$2

$(npm bin)/htd --app $app --file $package -k $HEROKU_API_KEY -v
