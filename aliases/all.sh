#! /bin/bash
ALIASES_PATH=${BASH_SOURCE[0]}

SCRIPTS=`ls $(dirname $ALIASES_PATH)/*.sh | grep -v $(basename $ALIASES_PATH)`

for s in $SCRIPTS ; do source $s ; done