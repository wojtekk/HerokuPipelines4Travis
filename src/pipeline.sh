#!/usr/bin/env bash
set -e

environment=$1

# Provision pipeline

node $HP4T_EXTENSION_DIR/src/pipeline.js $PWD/infrastructure/pipeline.js
