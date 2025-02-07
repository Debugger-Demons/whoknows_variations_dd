#!/bin/bash

PYTHON_SCRIPT_PATH="C:\Users\mazlu\vscodeprojects\4.sem\devops\whoknows_variations\src\backend\app.py"

#TMP="This variable might become useful at some point. Otherwise delete it." 

while true
do
    python3 $PYTHON_SCRIPT_PATH
    if [ $? -ne 0 ]; then
        echo "Script crashed with exit code $?. Restarting..." >&2
        sleep 1
    fi
done