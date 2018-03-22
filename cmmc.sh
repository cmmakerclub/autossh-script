#!/bin/sh
VERSION=0.0.1
usage() {
        cat <<EOF
cmmc v$VERSION
Usage: $0 [autossh|--help]
EOF
        exit 1
} 

autossh_fn() {
  usage() {
        cat <<EOF
    Usage: $0 $1 [config|help]
EOF
  }
  case "$1" in
    config) echo "enter config";;
    *) usage "autossh";;
  esac

}

case "$1" in
        --help|help) usage;;
        autossh) autossh_fn $2;;
        *) usage;;
esac
