#!/usr/bin/env bash
BASEDIR=$(dirname "$0")

TERM=xterm-256color emacs -q --load $BASEDIR/init.el
