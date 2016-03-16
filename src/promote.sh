#!/usr/bin/env bash
set -e

app=$1

# Promote stage to production
heroku pipelines:promote --app $app;
