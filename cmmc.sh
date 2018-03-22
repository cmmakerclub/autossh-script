#!/bin/sh
VERSION=0.0.1
usage() {
        cat <<EOF
cmmc v$VERSION
Usage: $0 [--help]
EOF
        exit 1
} 

case "$1" in
        --help|help) usage;;
        *) usage;;
esac
