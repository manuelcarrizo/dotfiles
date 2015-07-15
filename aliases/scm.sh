#! /bin/bash

is_git() {
    git status 2>&1 | grep "Not a git repository" > /dev/null ;
    echo $?
}

is_svn() {
    svn info 2>&1 | grep "is not a working copy" > /dev/null ;
    echo $?
}

do_status() {
    if [ $(is_git) -eq 1 ]; then
        git status .
    elif [ $(is_svn) -eq 1 ]; then
        svn status
    fi
}

do_quiet() {
    if [ $(is_git) -eq 1 ]; then
        git status --untracked=no
    elif [ $(is_svn) -eq 1 ]; then
        svn status | grep -v ^? | grep -v ^$ | grep -v "Performing status on external"
    fi
}

do_add() {
    [ $# -eq 0 ] && { echo "No files to add"; exit 1; }

    if [ $(is_git) -eq 1 ]; then
        git add $@
    elif [ $(is_svn) -eq 1 ]; then
        svn add $@
    fi
}

do_commit() {
    [ $# -eq 0 ] && { echo "No commit message given"; exit 1; }
    if [ $(is_git) -eq 1 ]; then
        git commit -m "$@"
    elif [ $(is_svn) -eq 1 ]; then
        svn commit -m "$@"
    fi
}

do_last_commit() {
    file=$1

    if [ $(is_git) -eq 1 ]; then
        git rev-list -n 1 HEAD -- "$file"
    elif [ $(is_svn) -eq 1 ]; then
        echo "Not implemented"
    fi
}

do_recover() {
    file=$1

    if [ $(is_git) -eq 1 ]; then
        git checkout $(git rev-list -n 1 HEAD -- "$file")^ -- "$file"
    elif [ $(is_svn) -eq 1 ]; then
        echo "Not implemented"
    fi
}

alias status='do_status'
alias quiet='do_quiet'
alias add='do_add'
alias commit='do_commit'
alias last_commit='do_last_commit'
alias recover='do_recover'
alias latest='git stash && git pull && git stash pop'