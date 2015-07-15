#! /bin/bash

do_activate() {
    if [ -f venv/bin/activate ] ;
    then 
        source venv/bin/activate
    fi
}

alias activate="do_activate"