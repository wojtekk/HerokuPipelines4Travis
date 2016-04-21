#!/usr/bin/env bash
set -e

# Safe commands don't affect production or stage environment
safeCommands=( "export" "setup");

# A few important directories

export HP4T_PROJECT_DIR=$PWD

if [ "$(uname -s)" == "Darwin" ]; then
  export HP4T_EXTENSION_DIR="$(cd $(dirname $(realpath "${BASH_SOURCE[0]}"))/.. && pwd)"
else
  export HP4T_EXTENSION_DIR="$(cd $(dirname $(readlink -f "${BASH_SOURCE[0]}"))/.. && pwd)"
fi

export HP4T_TEMPLATES_DIR="$HP4T_EXTENSION_DIR/templates"
