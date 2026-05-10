#!/usr/bin/env bash

verify_installation() {
  log "Verifying installation..."

  # print macOS version information
  sw_vers

  command -v brew >/dev/null 2>&1 || fail "brew is missing"
  command -v fish >/dev/null 2>&1 || fail "fish is missing"
  command -v starship >/dev/null 2>&1 || fail "starship is missing"
  command -v git >/dev/null 2>&1 || fail "git is missing"
  command -v fnm >/dev/null 2>&1 || fail "fnm is missing"

  [[ -f "$HOME/.config/fish/conf.d/brew.fish" ]] || fail "brew.fish was not created"
  [[ -f "$HOME/.config/fish/conf.d/fnm.fish" ]] || fail "fnm.fish was not created"
  [[ -f "$HOME/.config/fish/completions/fnm.fish" ]] || fail "FNM Fish completions were not created"

  log "Homebrew: $(brew --version | head -n 1)"
  log "Fish: $(fish --version)"
  log "Starship: $(starship --version | head -n 1)"
  log "Git: $(git --version)"
  log "FNM: $(fnm --version)"

  if [[ "${INSTALL_LATEST_NODE:-true}" != "true" ]]; then
    command -v node >/dev/null 2>&1 || fail "Node.js is missing"
    log "Node.js: $(node --version)"
  fi
}
