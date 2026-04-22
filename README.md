# .config

This repo currently manages:

- `starship` via [starship.toml](/Users/morishitag/.config/starship.toml)
- `nvim` via [nvim/init.lua](/Users/morishitag/.config/nvim/init.lua)

## Requirements

- `git`
- `starship`
- `nvim` `0.11+`
- a Nerd Font in your terminal

For full Neovim LSP support, make sure these executables are on `PATH` because they are enabled in [nvim/lua/config/lsp.lua](/Users/morishitag/.config/nvim/lua/config/lsp.lua):

- `lua-language-server`
- `basedpyright-langserver`
- `stan-language-server`

## Install Into `~/.config`

If you want this repo to be your live config directory:

```bash
git clone <repo-url> ~/.config
cd ~/.config
```

If the repo lives somewhere else, link only the managed entries:

```bash
mkdir -p ~/.config
ln -sfn /path/to/repo/starship.toml ~/.config/starship.toml
ln -sfn /path/to/repo/nvim ~/.config/nvim
```

## Initialize `starship`

Install it first:

```bash
brew install starship
```

Enable it in `zsh` by adding this to `~/.zshrc`:

```bash
eval "$(starship init zsh)"
```

Open a new shell and `starship` will load [starship.toml](/Users/morishitag/.config/starship.toml).

## Initialize `nvim`

Install Neovim:

```bash
brew install neovim git
```

Then launch it once:

```bash
nvim
```

On first start, [nvim/lua/config/lazy.lua](/Users/morishitag/.config/nvim/lua/config/lazy.lua) bootstraps `lazy.nvim` automatically and installs the configured plugins. After that, restart `nvim` if needed.

## Verify

```bash
starship --version
nvim --version
```
