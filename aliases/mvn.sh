#! /bin/bash

function do_springboot() {
    if [ "$1" == "clean" ]
    then
        do_mvn_clean && do_springboot
    else
        mvn spring-boot:run
    fi
}

function do_mvn_clean() {
    mvn clean install
}

alias springboot="do_springboot"
alias mvn-clean="do_mvn_clean"