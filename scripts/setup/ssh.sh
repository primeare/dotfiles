#!/usr/bin/env bash

setup_ssh() {
  mkdir -p "$HOME/.ssh"
  chmod 700 "$HOME/.ssh"

  local ssh_config="$HOME/.ssh/config"

  [[ -f "$ssh_config" ]] || fail "SSH config was not found: $ssh_config"

  chmod 600 "$ssh_config"
}

generate_ssh_key() {
  local key_path="$HOME/.ssh/id_ed25519"
  local email

  if [[ -f "$key_path" ]]; then
    log "SSH key already exists: $key_path"
    return
  fi

  if [[ "${GENERATE_SSH_KEY:-false}" != "true" ]]; then
    log "Skipping SSH key generation"
    return
  fi

  email="$(git config --global user.email || true)"

  if [[ -z "$email" ]]; then
    fail "Git user.email is not configured; cannot generate SSH key comment"
  fi

  ssh-keygen -t ed25519 \
    -C "$email" \
    -f "$key_path" \
    -a 100

  chmod 600 "$key_path"
  chmod 644 "$key_path.pub"

  log "Generated SSH key: $key_path"
  warn "Add this public key to GitHub:"
  cat "$key_path.pub"
}
