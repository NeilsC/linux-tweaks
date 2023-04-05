#!/bin/bash

# Inspired by https://stackoverflow.com/a/71968909

signal() {
  echo "$(date) : kill ${1} ${2}"
  kill ${1} ${2} || exit 0
}

PID=$(pgrep -f 'teams.*disable-setuid-sandbox')

[ -z "${PID}" ] && {
  echo "$(date) : Teams process not found" >&2
  exit 1
}

signal -SIGUSR1 ${PID}
