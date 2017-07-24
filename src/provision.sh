#!/usr/bin/env bash
set -e

environment=$1

# Provision the app

node $HP4T_EXTENSION_DIR/src/provision.js $PWD/infrastructure/$environment.js
