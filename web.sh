#!/bin/bash

#
# super simple script to start & stop server
# no error checking, hardcoded variables, etc.
# TODO: create variable for port
#
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. "${SCRIPT_DIR}"/venv/bin/activate

function start_ws() {
  gunicorn --chdir ${SCRIPT_DIR} --bind 0.0.0.0:9091 --pid "${SCRIPT_DIR}"/web.pid --daemon wsgi:app 2> /dev/null
}

function stop_ws() {
  [[ -f "${SCRIPT_DIR}/web.pid" ]] && kill -9 "$(cat "${SCRIPT_DIR}"/web.pid)" 2> /dev/null
  # shellcheck disable=SC2009
  # cant use pgrep as it is python not gunicorn
  running=$(ps auwwwx | grep -i gunicorn | grep -v grep)
  until [[ -z ${running} ]]; do
    sleep 1
    # shellcheck disable=SC2009
    running=$(ps auwwwx | grep -i gunicorn | grep -v grep)
  done
}

if [[ -z $1 ]]; then
  echo "required arg: start or stop"
  exit 1
fi

if [[ $1 == "start" ]]; then
  stop_ws
  start_ws
  echo "server running"
elif [[ $1 == "stop" ]]; then
  stop_ws
  echo "server stopped"
else
  echo "command invalid: $1"
  exit 1
fi
