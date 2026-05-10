#!/usr/bin/env bash

install_xcode_command_line_tools() {
  if [[ "${CI:-false}" == "true" ]]; then
    log "CI environment: Skipping Xcode Command Line Tools check"
    return
  fi

  if xcode-select -p >/dev/null 2>&1; then
    log "Xcode Command Line Tools are already installed"
    return
  fi

  warn "Xcode Command Line Tools are required"
  warn "Starting installation. Re-run this script after installation finishes"

  xcode-select --install || true
  exit 1
}
