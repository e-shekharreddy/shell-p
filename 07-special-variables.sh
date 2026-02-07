#!/bin/bsh

echo "All args passed to scripts: $@"
echo "Number of vars passed to scripts: $#"
echo "Script name: $0"
echo "present directory: $PWD"
echo "Who is runnung: $USER"
echo "Home directory of current user: $HOME"
echo "PID of the script: $$"

sleep 100 & # here & is used to run the process background

echo "PID of recently executed background process: $!"
echo "All args passed to script: $*"