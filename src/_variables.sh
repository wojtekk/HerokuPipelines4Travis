#!/usr/bin/env bash
set -e

# Safe commands don't affect production or stage environment
safeCommands=( "export" "update-nodejs" "setup" "install-heroin-js");

# A few important directories

HP4T_PROJECT_DIR=$PWD
HP4T_EXTENSION_DIR="$(cd $(dirname $(readlink -f "${BASH_SOURCE[0]}"))/.. && pwd)"
HP4T_TEMPLATES_DIR="$HP4T_EXTENSION_DIR/templates"
