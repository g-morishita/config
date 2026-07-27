#!/bin/zsh

set -euo pipefail

repo_root=${0:A:h:h}

zsh -n "$repo_root/zsh/.zshrc"
zsh -n "$repo_root/scripts/install.sh"
plutil -convert xml1 -o /dev/null -- "$repo_root/iterm2/g-morishita.json"

if command -v starship >/dev/null 2>&1; then
  STARSHIP_CONFIG="$repo_root/starship.toml" starship config >/dev/null
fi

print "Terminal configuration is valid."
