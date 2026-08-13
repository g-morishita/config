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

Neovim installs its configured language servers and development tools through Mason on first launch. The focused setup supports Python, R, Markdown, LaTeX, Lua, shell, JSON, JavaScript/TypeScript, Docker, HTML, and CSS.

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

## Neovim

The Neovim setup includes:

- Tokyo Night with a status line, icons, indentation guides, smooth scrolling, and cursor animation
- Neo-tree as the single sidebar file explorer (`<leader>e`)
- Snacks for file search (`<leader><space>`), text search (`<leader>/`), buffers (`<leader>,`), and Git views
- completion, diagnostics, formatting, linting, Git signs, comments, and automatic bracket pairs
- rendered Markdown, a CSV table viewer, CSS color previews, and HTML tag completion
- VimTeX with Skim for LaTeX PDF viewing

Mason installs only the language tools used by this setup. R uses `languageserver` for code intelligence and Air for formatting; Python uses BasedPyright and Ruff.

VimTeX expects a TeX distribution that provides `latexmk`. Install one separately if it is not already available:

```bash
brew install --cask mactex-no-gui
```

The Brewfile installs Skim as the PDF viewer. In a LaTeX buffer, use `\ll` to compile and `\lv` to open the PDF.

See the browser-friendly [Neovim manual](docs/nvim-manual/index.html) for the complete setup guide, keybindings, language-tool matrix, and troubleshooting instructions.

## Verify

```bash
./scripts/validate.sh
```

On first launch, Neovim bootstraps `lazy.nvim` and installs the configured plugins. Restart Neovim afterward if needed.
