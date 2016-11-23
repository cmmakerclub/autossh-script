#!/bin/bash 

echo "reboot: "
echo $(date)
PORT=40001
while true
do
 /bin/pidof ssh > /dev/null
 if [[ $? -ne 0 ]]; then
   echo $(date)
   echo "Restarting autossh service..."
   autossh -f -N -M 65500 -o ServerAliveInterval=20 -R $PORT:localhost:22 device@ssh.cmmc.io -v
 fi
 sleep 9;
done
##@reboot /home/pi/autossh/autossh.sh > /home/pi/autossh.log 2>&1
