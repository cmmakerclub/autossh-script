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
        install) 
          echo "enter install"
          cd /home/pi
          wget https://github.com/cmmakerclub/autossh-script/archive/v0.0.1.tar.gz  -O- | tar xvz
          if [[ $? -eq 0 ]]; then
            echo "install autossh plugin for cmmc script is completed."
            #echo "setting crontab!"
            #cmmc autossh install
          fi
          #sudo ln -fvs /home/$USER/autossh-script/cmmc.sh /usr/bin/cmmc
        ;;
        uninstall) 
          echo "uninstall"
          sudo rm -v /usr/bin/cmmc
        ;;
        autossh) 
          source /home/pi/autossh-script/subtasks/_autossh.sh;
          autossh_fn $2;;
        *) usage;;
esac
