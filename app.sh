#!/bin/bash 

REMOTE_PORT=`(cat /boot/cmmc_port.txt | tr -d '\n')`
REMOTE_HOST=`(cat /boot/cmmc_host.txt | tr -d '\n')`

/bin/pidof ssh > /dev/null
if [[ $? -ne 0 ]]; then
  echo $(date)
  echo "Restarting autossh service..."
  autossh -f -N -M 0 -o ServerAliveInterval=20 -R $REMOTE_PORT:127.0.0.1:22 $REMOTE_HOST -v
else
  echo "autossh is running"
fi
