#!/usr/bin/env bash
set -e

# A few important directories

export HP4T_PROJECT_DIR=$PWD
export HP4T_EXTENSION_DIR="$(cd $(dirname $(readlink -f "${BASH_SOURCE[0]}"))/.. && pwd)"
export HP4T_TEMPLATES_DIR="$HP4T_EXTENSION_DIR/templates"
export COMMANDS_DIR="$(dirname $(readlink -f "${BASH_SOURCE[0]}"))"

# Run command and pass all params

commandName=$1

command="$COMMANDS_DIR/$commandName.sh"
params="$(printf " %q" "${@:2}")"

bash -c "$command $params"
