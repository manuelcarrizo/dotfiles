#!/bin/bash

if [ "$SYSTEM" == "Debian" ]
then
    EXTRA_PKGS="$CURRENT_PATH/debian"
elif [ "$SYSTEM" == "Ubuntu" ]
then
    EXTRA_PKGS="$CURRENT_PATH/ubuntu"
fi

CURRENT_PATH=`dirname ${BASH_SOURCE}`
sudo apt-get install -y $(cat $CURRENT_PATH/packages $EXTRA_PKGS | grep -vE "^\s*#" | tr "\n" " ")

curl -sSL https://get.docker.com/ | sh

NEW_GROUPS="wireshark docker"
for g in $NEW_GROUPS ; do sudo usermod -a -G $g $USER ; done
