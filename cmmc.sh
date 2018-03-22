#!/bin/bash

VERSION=0.0.1
usage() {
        cat <<EOF
cmmc v$VERSION
Usage: $0 [autossh|--help]
EOF
        exit 1
} 

case "$1" in
        --help|help) usage;;
        autossh) 
          source /home/pi/autossh-script/subtasks/_autossh.sh;
          autossh_fn $2;;
        *) usage;;
esac
