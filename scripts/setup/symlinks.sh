#!/usr/bin/env bash

# TODO: use "associative array" when Bash 4 comes to macOS
LINKING_MAP=(
  ".gitconfig:$HOME/.config/git/config"
  ".gitmessage:$HOME/.gitmessage"
  ".npmrc:$HOME/.npmrc"
  ".config/fish/config.fish:$HOME/.config/fish/config.fish"
  ".config/fish/functions:$HOME/.config/fish/functions"
  ".config/starship.toml:$HOME/.config/starship.toml"
  ".vscode/settings.json:$HOME/Library/Application Support/Code/User/settings.json"
  ".vscode/keybindings.json:$HOME/Library/Application Support/Code/User/keybindings.json"
  ".vscode/global.code-snippets:$HOME/Library/Application Support/Code/User/snippets/global.code-snippets"
)

backup_path() {
  local target="$1"
  local backup_target

  mkdir -p "$BACKUP_DIR"

  backup_target="$BACKUP_DIR/${target#"$HOME"/}"

  mkdir -p "$(dirname "$backup_target")"
  mv "$target" "$backup_target"

  warn "Backed up existing path:"
  warn "  from: $target"
  warn "  to:   $backup_target"
}

link_dotfile() {
  local source_relative="$1"
  local target="$2"

  local source="$DOTFILES_DIR/$source_relative"
  local target_dir
  local current_link

  [[ -e "$source" ]] || fail "Source does not exist: $source"

  target_dir="$(dirname "$target")"
  mkdir -p "$target_dir"

  if [[ -L "$target" ]]; then
    current_link="$(readlink "$target")"

    if [[ "$current_link" == "$source" ]]; then
      log "Already linked: $target"
      return
    fi

    rm "$target"
  elif [[ -e "$target" ]]; then
    backup_path "$target"
  fi

  ln -s -v "$source" "$target"
}

link_dotfiles() {
  local entry
  local source
  local target

  for entry in "${LINKING_MAP[@]}"; do
    source="${entry%%:*}"
    target="${entry#*:}"

    link_dotfile "$source" "$target"
  done
}
