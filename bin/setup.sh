#!/usr/bin/env bash
set -e

export HP4T_EXTENSION_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"

. $HP4T_EXTENSION_DIR/scripts/variables.sh

$HP4T_SCRIPTS_DIR/initialise-infrastructure.sh
$HP4T_SCRIPTS_DIR/initialise-travis.sh
