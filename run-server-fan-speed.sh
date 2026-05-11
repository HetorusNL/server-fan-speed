#!/bin/bash

# magic options for bash to make scripts safer
set -Eeuxo pipefail

# run the prepare script to install ipmitool
./prepare.sh

# start the python server using uv
uv run main.py
