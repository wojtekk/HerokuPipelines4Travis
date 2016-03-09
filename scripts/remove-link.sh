#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. $DIR/variables.sh

if [ -d $HP4T_DESTINATION_DIR ]; then
  rm $HP4T_DESTINATION_DIR
fi
