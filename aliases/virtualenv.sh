#! /bin/bash

do_activate() {
    if [ -f venv/bin/activate ] ;
    then 
        source venv/bin/activate
    fi
}

do_venv() {
    if [ ! -d venv ] ;
    then 
        virtualenv venv
    fi
}

alias activate="do_activate"
alias venv="do_venv"