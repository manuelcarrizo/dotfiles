#!/bin/bash
CURRENT_PATH=`dirname ${BASH_SOURCE}`
sudo apt-get install $(grep -vE "^\s*#" $CURRENT_PATH/packages  | tr "\n" " ")