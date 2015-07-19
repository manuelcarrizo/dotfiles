#!/bin/bash
CURRENT_PATH=`dirname ${BASH_SOURCE}`
sudo apt-get install $(grep -vE "^\s*#" $CURRENT_PATH/packages  | tr "\n" " ")

NEW_GROUPS="wireshark docker"
for g in $NEW_GROUPS ; do sudo usermod -a -G $g $USER ; done