#!/usr/bin/env bash

get_current_login_shell() {
  dscl . -read "/Users/$(whoami)" UserShell | awk '{print $2}'
}

setup_fish_shell() {
  local fish_bin

  fish_bin="$(command -v fish)" || fail "Fish is not installed"

  if grep -Fxq "$fish_bin" /etc/shells; then
    log "Fish is already listed in /etc/shells"
  else
    log "Adding Fish to /etc/shells: $fish_bin"
    echo "$fish_bin" | sudo tee -a /etc/shells >/dev/null
  fi

  if [[ "${SET_FISH_AS_DEFAULT:-true}" != "true" ]]; then
    log "Skipping default shell change"
    return
  fi

  if [[ "$(get_current_login_shell)" == "$fish_bin" ]]; then
    log "Fish is already the default shell"
    return
  fi

  log "Changing default shell to Fish: $fish_bin"
  chsh -s "$fish_bin" "$(whoami)"
}

verify_fish_config() {
  local fish_config="$HOME/.config/fish/config.fish"

  [[ -f "$fish_config" ]] || fail "Fish config was not found: $fish_config"

  log "Checking Fish config syntax..."
  fish --no-execute "$fish_config"
}
