#!/usr/bin/env bash

log() {
  printf "\033[1;34m[setup]\033[0m %s\n" "$1"
}

warn() {
  printf "\033[1;33m[setup]\033[0m %s\n" "$1"
}

fail() {
  printf "\033[1;31m[setup]\033[0m %s\n" "$1" >&2
  exit 1
}
