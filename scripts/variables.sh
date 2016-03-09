#!/usr/bin/env bash
set -e

export HP4T_PROJECT_DIR=$PWD
export HP4T_EXTENSION_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"

export HP4T_PROJECT_SCRIPTS_DIR="$HP4T_PROJECT_DIR/scripts"
export HP4T_PROJECT_HP4T_DIR="$HP4T_PROJECT_SCRIPTS_DIR/hp4t"
export HP4T_SOURCE_DIR="$HP4T_EXTENSION_DIR/src"
export HP4T_SCRIPTS_DIR="$HP4T_EXTENSION_DIR/scripts"
export HP4T_TEMPLATES_DIR="$HP4T_EXTENSION_DIR/templates"

export HP4T_HEROIN_VERSION="1.5.0"
export HP4T_LODASH_VERSION="4.1.0"