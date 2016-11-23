#!/bin/bash

PORT=`(cat /boot/cmmc_port.txt | tr -d '\n')`

echo $PORT | hexdump -C
echo $PORT | tr -d '\n' |  hexdump -C
