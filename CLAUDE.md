# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Arch Linux dotfiles managed with **GNU Stow**. Each top-level directory is a Stow package that mirrors the home directory structure. Running `stow <package>` creates symlinks from `~` into the package directory.

## Common Commands

```bash
# Sync all dotfiles and backup package list
~/.dotfiles/sync.sh

# Stow a single package
cd ~/.dotfiles && stow <package>

# Unstow a package
cd ~/.dotfiles && stow -D <package>

# Restow (re-create symlinks, useful after moving files)
cd ~/.dotfiles && stow -R <package>

# Save current i3 workspace layouts
~/.scripts/i3_save.sh

# Restore i3 workspace layouts
~/.scripts/i3_restore.sh
```

## Repository Structure

Each top-level directory is a Stow package. The directory structure inside each package mirrors the home directory:

```
alacritty/.config/alacritty/alacritty.toml
    → ~/.config/alacritty/alacritty.toml
```

**Packages:** `alacritty`, `albert`, `arch`, `dunst`, `flameshot`, `git`, `gtk`, `i3`, `i3-resurrect`, `lvim`, `picom`, `pistol`, `polybar`, `ranger`, `redshift`, `rofi`, `scripts`, `spicetify`, `sptlrx`, `thunar`, `vim`, `vis`, `X-Settings`, `zathura`, `zsh`

Scripts live in `scripts/.scripts/` and are added to `$PATH` via `.zshrc`.

## Key Architecture Notes

- **Theme:** Catppuccin Mocha throughout (polybar, dunst, rofi, FZF, zathura, lock screen)
- **Shell:** Zsh with Powerlevel10k prompt; aliases `vim→lvim`, `ls→eza`, `cat→bat`, `ra→ranger`
- **Editor:** LunarVim (`lvim`) as `$EDITOR`
- **WM:** i3 with polybar (status bar), picom (compositor), dunst (notifications), albert/rofi (launchers)
- **i3 workspaces:** Persisted via i3-resurrect; save/restore scripts handle workspaces 1–9 + scratch
- **Lock screen:** `lock.sh` uses i3lock-color with blurred wallpaper; `auto_lock.sh` uses xidlehook (14min warning, 15min lock, 16min suspend); respects active audio playback
- **Brightness:** External monitor brightness via ddcutil (`brightness_control.sh`, ±15%)
- **File preview:** `pistol` for file type previews; `preview_ueber.sh` for FZF integration
- **Package list backup:** `sync.sh` runs `pacman -Qe > arch/pkglist.txt` automatically

## Adding a New Package

1. Create the package directory mirroring home structure: `<pkg>/.config/<app>/`
2. Place config files inside
3. Add the package name to the `programs` array in `sync.sh`
4. Run `stow <pkg>` from `~/.dotfiles/`
