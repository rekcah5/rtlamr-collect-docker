#!/bin/bash
  
trap "exit" INT TERM
trap "kill 0" EXIT

# turn on bash's job control
set -m
env
rtl_tcp &
sleep 1
#rtlamr &
rtlamr | rtlamr-collect

# now we bring the primary process back into the foreground
# and leave it there
#fg %2