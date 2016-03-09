#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/variables.sh

if [ ! -d $HP4T_PROJECT_SCRIPTS_DIR ]; then
  mkdir -p $HP4T_PROJECT_SCRIPTS_DIR
fi

if [ ! -d $HP4T_DESTINATION_DIR ]; then
  ln -s $HP4T_PROJECT_SCRIPTS_DIR $HP4T_DESTINATION_DIR
fi
