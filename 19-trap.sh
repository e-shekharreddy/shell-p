#!/bin/bash 

set -e  #ERR
trap 'echo "There is an error in $LINENO, Command: $BASH_COMMAND" ' ERR

echo "hello world"
echo "i am learning devops"
echoo "along with that"
echo "iam learning ansibel and shell"
