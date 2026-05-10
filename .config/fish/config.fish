# Disable Fish greeting
set --global fish_greeting

# add local executables to PATH
fish_add_path "$HOME/.npm-packages/bin"
fish_add_path "$HOME/.bin"
fish_add_path "$HOME/.local/bin"

# add Visual Studio Code (code) to PATH
if test -d "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
  fish_add_path "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
end

# command aliases and shortcuts
alias c="clear"

# set Visual Studio Code as a default text editor
if command -q code
  set --global --export EDITOR "code --wait --new-window"
  set --global --export VISUAL "code --wait --new-window"
else
  set --global --export EDITOR nano
  set --global --export VISUAL nano
end

if status is-interactive
  # initialise Starship
  starship init fish | source

  # enable transient prompt
  enable_transience
end
