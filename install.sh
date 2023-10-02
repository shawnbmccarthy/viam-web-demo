#!/bin/bash

#
# this is a very basic install.sh file
#
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [[ ! -f "${SCRIPT_DIR}"/venv/bin/activate ]]; then
  python3 -m venv "${SCRIPT_DIR}"/venv
  exec "${SCRIPT_DIR}"/venv/bin/python -m pip install -Ur "${SCRIPT_DIR}"/requirements.txt
fi

echo "install complete"