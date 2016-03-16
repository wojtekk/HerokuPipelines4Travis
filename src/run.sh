#!/usr/bin/env bash
set -e

app=$1
command=$2

heroku run $command --app $app
