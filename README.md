# Nvim configuration

This repository contains my [Neovim](https://github.com/neovim/neovim) configuration. I used [NvChad](https://github.com/NvChad/starter) configuration as starting point.

## Pre-requisites

  * Neovim 0.10.
  * Nerd Font as your terminal font.
    * Make sure the nerd font you set doesn't end with Mono to prevent small icons.
      Example : JetbrainsMono Nerd Font and not JetbrainsMono Nerd Font Mono
  * Ripgrep is required for grep searching with Telescope (OPTIONAL).
  * GCC, Windows users must have mingw installed and set on path.
  * Make, Windows users must have GnuWin32 installed and set on path.
  * Delete old neovim folders (check commands below)

## Installation

### Linux/MacOs

```bash
git clone https://github.com/Aaron70/nvim.git ~/.config/nvim && nvim
```
Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins.

### Windows

```powershell
git clone https://github.com/NvChad/starter $ENV:USERPROFILE\AppData\Local\nvim && nvim
```
Run `:MasonInstallAll` command after lazy.nvim finishes downloading plugins.

## Plugins

You can see the list of plugins added by [NvChad](https://nvchad.com/), here [plugins list](https://github.com/NvChad/NvChad?tab=readme-ov-file#plugins-list).
