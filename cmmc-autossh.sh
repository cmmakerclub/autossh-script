#!/bin/bash 

REMOTE_PORT=`(cat /boot/cmmc_ssh_port.txt | tr -d '\n')`
REMOTE_HOST=`(cat /boot/cmmc_ssh_host.txt | tr -d '\n')`
REMOTE_USER=device

/bin/pidof ssh > /dev/null
if [[ $? -ne 0 ]]; then
  echo $(date)
  echo "Restarting autossh service..."
  which autossh
  if [[ $? -eq 0 ]]; then
    autossh -f -N -M 0 -o ServerAliveInterval=20 -R $REMOTE_PORT:127.0.0.1:22 "$REMOTE_USER@$REMOTE_HOST" -v 
    echo "$REMOTE_USER@$REMOTE_HOST" 
  else
    echo "autossh not found. getting installed autossh"
    sudo apt-get install autossh
  fi

else
  echo "autossh is running"
fi
