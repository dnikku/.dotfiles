#!/bin/bash

#a gvim wrapper for sending files to remote server MAIN_SERVER

GVIM="/c/Program Files (x86)/Vim/vim82/gvim.exe"

if [ "$1" == "--no-remote" -o "$1" == "--" ]; then
    shift
    echo "runing: gvim $*"
    "$GVIM" $*
else
     echo "running: gvim --servername MAIN_SERVER $*"
    "$GVIM" --servername MAIN_SERVER --remote $* &
fi

