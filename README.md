# .config

This repo currently manages:

- `starship` via [starship.toml](starship.toml)
- `nvim` via [nvim/init.lua](nvim/init.lua)
- `zsh` via [zsh/.zshrc](zsh/.zshrc)
- iTerm2 via the dynamic profile in [iterm2/g-morishita.json](iterm2/g-morishita.json)
- terminal dependencies via [Brewfile](Brewfile)

## Requirements

- `git`
- `Homebrew` (for package installation)
- `starship`
- `nvim` `0.11+`
- a Nerd Font in your terminal

For full Neovim LSP support, make sure these executables are on `PATH` because they are enabled in [nvim/lua/config/lsp.lua](nvim/lua/config/lsp.lua):

- `lua-language-server`
- `basedpyright-langserver`
- `stan-language-server`

## Install

Clone the repository, then run the installer:

```bash
git clone git@github.com:g-morishita/config.git ~/config
cd ~/config
./scripts/install.sh --packages
```

Omit `--packages` when the Homebrew dependencies are already installed:

```bash
./scripts/install.sh
```

The installer links the managed Starship, Neovim, Zsh, and iTerm2 files into their expected locations. Existing files are moved to timestamped backups before linking.

The iTerm2 profile is a [dynamic profile](https://iterm2.com/documentation-dynamic-profiles.html). After installation, select `g-morishita` in **iTerm2 → Settings → Profiles** and make it the default.

## Shell features

- shared, deduplicated command history
- cached, case-insensitive native Zsh completion
- Starship prompt with Git state, command duration, and time
- `fzf` history and file search
- `zoxide` smarter directory navigation
- `eza` directory listings and `bat` file previews
- compact Git and navigation aliases

The aliases and optional tool initialization are guarded, so the shell still starts if an optional package is unavailable.

## Verify

```bash
./scripts/validate.sh
```

On first launch, Neovim bootstraps `lazy.nvim` and installs the configured plugins. Restart Neovim afterward if needed.
