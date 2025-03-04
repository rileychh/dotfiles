# Dotfiles

This repository contains my personal dotfiles - configuration files for various applications and tools I use daily.

## Management

These dotfiles are managed using [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager. This makes it easy to deploy configurations across different systems while keeping everything version controlled.

## Environments

These dotfiles are primarily used across my various systems:

- **Desktop/Workstation:** Arch Linux
- **Servers:** Rocky Linux 9

Some configurations may be specific to these distributions, but most should work on any Linux/Unix-like system with the appropriate software installed.

## Usage

To use these configurations:

1. Clone this repository to your home directory
2. Install GNU Stow (`sudo pacman -S stow` or `paru -S stow` on Arch Linux, `sudo dnf install stow` on Fedora/RHEL)
3. Navigate to this directory
4. Run `stow <package>` for each configuration set you want to use

## License

These dotfiles are licensed under the BSD Zero Clause License (0BSD). I chose this license for the same reason Arch Linux uses it for package sources - it's essentially a public domain equivalent license that allows anyone to do anything with the code without attribution or other requirements.

You can learn more about why Arch Linux uses this license [here](https://rfc.archlinux.page/0040-license-package-sources/).
