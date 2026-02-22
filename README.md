# Dotfiles

This repository contains my personal dotfiles - configuration files for various applications and tools I use daily.

## Management

These dotfiles are managed using [chezmoi](https://www.chezmoi.io/). OS-specific files are handled via `.chezmoiignore` — no heavy templating needed.

## Environments

These dotfiles are primarily used across my various systems:

- **Primary:** macOS
- **Servers:** Rocky Linux 8/9
- **Archived:** Arch Linux (see `stow-archive` branch)

## Usage

```sh
chezmoi init --apply https://github.com/rileychh/dotfiles.git
```

## License

These dotfiles are licensed under the BSD Zero Clause License (0BSD). I chose this license for the same reason Arch Linux uses it for package sources - it's essentially a public domain equivalent license that allows anyone to do anything with the code without attribution or other requirements.

You can learn more about why Arch Linux uses this license [here](https://rfc.archlinux.page/0040-license-package-sources/).
