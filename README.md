# Dotfiles

Personal dotfiles repository containing configuration files for various Linux applications and tools.

## Overview

This repository contains configuration files for a Linux development environment, including window managers, terminal emulators, text editors, shell configurations, and various productivity tools.

## Contents

### Window Managers

- **bspwm** - Binary Space Partitioning Window Manager configuration
- **i3** - i3 window manager configuration

### Terminal Emulators

- **alacritty** - Alacritty terminal configuration
- **kitty** - Kitty terminal configuration
- **wezterm** - WezTerm terminal configuration (using Firefly Traditional color scheme, JetBrains Mono font)

### Text Editors

- **nvim** - Neovim configuration using LazyVim framework
- **helix** - Helix editor configuration

### Shell & Terminal

- **zsh** - Zsh configuration with Oh My Zsh (robbyrussell theme) and Starship prompt
- **tmux** - Tmux configuration with TPM plugin manager, CPU/memory monitor, and custom keybindings
- **starship** - Starship cross-shell prompt configuration (Catppuccin Mocha theme)

### Application Launchers & UI

- **rofi** - Rofi application launcher with multiple themes (including Gruvbox Dark Hard as default)
- **picom** - Picom compositor configuration with animations

### Development Tools

- **vscode** - VS Code settings and keybindings

### Other Tools

- **sxhkd** - Simple X Hotkey Daemon configuration for keyboard shortcuts
- **fastfetch** - Fastfetch system information tool configuration
- **polybar** - Polybar status bar configuration (referenced in bspwm config)

## Shell Configuration (zsh)

The `.zshrc` includes:

- Oh My Zsh with git plugin
- Starship prompt integration
- Custom aliases for:
  - Package management (`apu`, `apuu`, `apin`, `sr`)
  - Git operations (`gs`, `ga`, `gc`, `gp`, `gpl`, `gpo`, `gchk`)
  - System services (`sngx`, `smysql`, `smdb`, `spsql`)
  - Development tools (`v`, `vi`, `r`, `ff`, `pa`)
- Path configurations for:
  - Neovim
  - Composer (Laravel)
  - NVM (Node Version Manager)
  - Lua Language Server
  - CMake
- Default editor set to `nvim`

## Tmux Configuration

Features:

- Base index starting at 1
- Status bar at the top with CPU and memory monitoring
- Custom keybindings:
  - `Alt+1-9` - Switch to window 1-9
  - `Alt+Arrow` - Navigate panes
  - `Alt+Shift+Arrow` - Resize panes
  - `Ctrl+p/n` - Previous/next window
- Plugins:
  - TPM (Tmux Plugin Manager)
  - tmux-sensible
  - tmux-cpu-mem-monitor

## Neovim Configuration

Uses LazyVim framework with:

- Lazy.nvim plugin manager
- Custom configuration in `lua/config/` directory
- Plugin configurations in `lua/plugins/`
- Stylua formatting configuration

## Starship Prompt

Customized prompt showing:

- OS and username
- Current directory
- Git branch and status
- Language versions (C, Rust, Go, Node.js, PHP, Java, Kotlin, Haskell, Python)
- Docker context
- Current time
- Uses Catppuccin Mocha color palette

## Installation

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) for managing dotfiles. Stow creates symlinks automatically, making it easy to install, update, and remove configurations.

### Prerequisites

Install GNU Stow if you don't have it:

```bash
# Debian/Ubuntu
sudo apt install stow

# Arch Linux
sudo pacman -S stow

# Fedora
sudo dnf install stow

# macOS (with Homebrew)
brew install stow
```

### Installation Steps

1. Clone this repository:

   ```bash
   git clone <repository-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Install all configurations using Stow:

   ```bash
   # Install all packages at once
   stow -t ~ */

   # Or install specific packages individually
   stow -t ~ zsh
   stow -t ~ nvim
   stow -t ~ tmux
   stow -t ~ starship
   stow -t ~ alacritty
   stow -t ~ kitty
   stow -t ~ wezterm
   stow -t ~ helix
   stow -t ~ bspwm
   stow -t ~ i3
   stow -t ~ rofi
   stow -t ~ picom
   stow -t ~ sxhkd
   stow -t ~ vscode
   stow -t ~ fastfetch
   ```

3. To remove a configuration:

   ```bash
   stow -D -t ~ <package-name>
   # Example: stow -D -t ~ nvim
   ```

4. To restow (update) a configuration:

   ```bash
   stow -R -t ~ <package-name>
   # Example: stow -R -t ~ zsh
   ```

5. Install required dependencies:
   - Oh My Zsh: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
   - Starship: Follow instructions at https://starship.rs/guide/#%F0%9F%9A%80-installation
   - Tmux plugins: Press `Prefix + I` in tmux after installation
   - LazyVim: Follow LazyVim installation guide

## Dependencies

### Required

- **GNU Stow** - Symlink manager for dotfiles (required for installation)

### Applications

- **zsh** - Z shell
- **Oh My Zsh** - Zsh framework
- **Starship** - Cross-shell prompt
- **tmux** - Terminal multiplexer
- **TPM** - Tmux Plugin Manager
- **Neovim** - Text editor
- **LazyVim** - Neovim configuration framework
- **bspwm** / **i3** - Window managers
- **sxhkd** - Hotkey daemon
- **rofi** - Application launcher
- **picom** - Compositor
- **alacritty** / **kitty** / **wezterm** - Terminal emulators
- **helix** - Text editor
- **fastfetch** - System information tool

## Notes

- This repository is structured for **GNU Stow**. Each directory (package) contains files that will be symlinked to your home directory when stowed. The directory structure within each package mirrors the target location (e.g., `nvim/.config/nvim/` becomes `~/.config/nvim/`).
- The bspwm configuration includes automatic desktop assignment rules for Firefox and VS Code
- Keyboard layout switching (US/RU) is configured via Alt+Shift toggle
- The configuration assumes a Linux environment
- Some paths are hardcoded to specific user directories and may need adjustment

## License

This is a personal configuration repository. Use at your own discretion.
