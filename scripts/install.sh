#!/bin/zsh

set -euo pipefail

repo_root=${0:A:h:h}
install_packages=false

if [[ ${1:-} == "--packages" ]]; then
  install_packages=true
elif [[ $# -gt 0 ]]; then
  print -u2 "usage: $0 [--packages]"
  exit 2
fi

backup_and_link() {
  local source_path=$1
  local target_path=$2

  mkdir -p "${target_path:h}"

  if [[ -L $target_path && ${target_path:A} == ${source_path:A} ]]; then
    print "already linked: $target_path"
    return
  fi

  if [[ -e $target_path || -L $target_path ]]; then
    local backup_path="${target_path}.backup-$(date +%Y%m%d%H%M%S)"
    mv "$target_path" "$backup_path"
    print "backed up: $target_path -> $backup_path"
  fi

  ln -s "$source_path" "$target_path"
  print "linked: $target_path -> $source_path"
}

if $install_packages; then
  if ! command -v brew >/dev/null 2>&1; then
    print -u2 "Homebrew is required. Install it from https://brew.sh and rerun with --packages."
    exit 1
  fi
  brew bundle --file "$repo_root/Brewfile"
fi

backup_and_link "$repo_root/starship.toml" "$HOME/.config/starship.toml"
backup_and_link "$repo_root/nvim" "$HOME/.config/nvim"
backup_and_link "$repo_root/zsh/.zshrc" "$HOME/.zshrc"
backup_and_link \
  "$repo_root/iterm2/g-morishita.json" \
  "$HOME/Library/Application Support/iTerm2/DynamicProfiles/g-morishita.json"

print
print "Setup complete. In iTerm2, select the “g-morishita” profile and make it the default."
print "Open a new terminal session to load the Zsh and Starship configuration."
