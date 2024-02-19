# Louie's dotfiles

Welcome! This repository contains my personal dotfiles for various tools and applications. You can use them with the `stow` tool to manage and link them to your desired locations.

## Prerequisites

* A Linux system
* [stow](https://www.gnu.org/software/stow/manual/) installed 

## Installation

1. Clone this repository:

```bash
git clone git@github.com:louielyl/dotfiles.git
```

2. Apply the dotfiles to your home directory

```bash
stow .
```

## Customization:

- You can customize dotfiles by editing the symlinks in your target directory.

## Additional Notes
- This repository uses symlinks to avoid modifying original files.
- Be aware of potential conflicts with existing configurations.
- Report any issues or suggest improvements on the GitHub repository.

## Resources
- stow man page: https://www.gnu.org/software/stow/manual/
- Enjoy using my dotfiles!
