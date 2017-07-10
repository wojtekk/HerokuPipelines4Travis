#!/usr/bin/env bash
set -e

# Safe commands don't affect production or stage environment
safeCommands=( "export" "update-nodejs" "setup" "install-heroin-js" "package-npm");

# A few important directories

export HP4T_PROJECT_DIR=$PWD
export HP4T_EXTENSION_DIR="$(cd $(dirname $(readlink -f "${BASH_SOURCE[0]}"))/.. && pwd)"
export HP4T_TEMPLATES_DIR="$HP4T_EXTENSION_DIR/templates"
