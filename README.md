# Zsh Setup Script (zsh-config.sh)

This repository contains a powerful, feature-rich script for setting up Zsh with Oh My Zsh, complete with carefully selected plugins, themes, and productivity enhancements.

Repository: [https://github.com/beslintony/zsh-setup](https://github.com/beslintony/zsh-setup)

## Features

### Core Components
- **Zsh** - The modern shell that enhances your command line experience
- **Oh My Zsh** - A framework for managing your Zsh configuration
- **Half-life theme** - Clean, informative shell prompt with Git integration
- **Powerlevel10k** - An even more powerful theme (installed as an alternative option)

### Enhanced User Experience
- **Syntax highlighting** - Commands are colored based on correctness
- **Auto-suggestions** - Fish-like suggestions as you type
- **Command correction** - Suggestions when you mistype commands
- **Directory jumping** - Smart directory navigation with 'z'
- **Interactive directory navigation** - Browse directories with ease
- **Fuzzy finding** - Search through history and files with fzf

### Modern CLI Tools
- **exa** - Modern replacement for 'ls' with improved formatting and Git integration
- **bat** - Modern replacement for 'cat' with syntax highlighting and git integration
- **neofetch** - System information display with visuals
- **htop** - Interactive process viewer and system monitor
- **thefuck** - Magnificent app that corrects your previous console command

### Developer Workflow Optimization
- **Git integration** - Powerful Git aliases and status in your prompt
- **Docker workflow** - Aliases and shortcuts for Docker commands
- **Package manager integration** - npm, pip, etc.
- **Web search capabilities** - Search the web directly from your terminal
- **Python virtual environment** - Easy setup and activation

### Smart Features
- **Extract function** - A universal extraction tool for any archive type
- **Command history** - Enhanced, searchable history with deduplication
- **Auto CD** - Type a directory name to change to it
- **Directory stack** - Navigate between directories efficiently

## Installation

```bash
# Method 1: Direct installation (recommended)
wget -O zsh-config.sh https://raw.githubusercontent.com/beslintony/zsh-setup/main/zsh-config.sh
chmod +x zsh-config.sh
./zsh-config.sh

# Method 2: Clone the repository
git clone https://github.com/beslintony/zsh-setup.git
cd zsh-setup
chmod +x zsh-config.sh
./zsh-config.sh
```

After installation, log out and log back in, or run `exec zsh` to apply changes.

## Usage Tips

### Key Shortcuts
- `Tab` - Command and argument completion
- `Ctrl+R` - Fuzzy search through command history
- `Alt+Left/Right` - Navigate directory history
- `Esc+Esc` - Add sudo to the current command
- `z [pattern]` - Jump to a frequently used directory

### Custom Functions
- `mcd [directory]` - Create a directory and cd into it
- `extract [file]` - Extract any archive (zip, tar.gz, etc.)
- `hg [pattern]` - Search history for a command
- `ff [pattern]` - Find files by name
- `fd [pattern]` - Find directories by name
- `bak [file]` - Create a quick backup of a file

### Useful Aliases
- `update` - Update your system (apt-based)
- `myip` - Display your public IP address
- `weather` - Show current weather for your location
- `ports` - Display all open ports
- `sysinfo` - Display system information with neofetch
- Git aliases: `gs`, `ga`, `gc`, `gp`, etc.
- Docker aliases: `dps`, `di`, `dexec`, etc.

## Customization

The script creates a well-documented `.zshrc` file that you can easily edit:

```bash
nano ~/.zshrc
```

### Changing Themes
To switch to Powerlevel10k (a more feature-rich theme), edit `.zshrc` and change:

```bash
ZSH_THEME="half-life"
```

to:

```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

When you first use powerlevel10k, it will launch a configuration wizard.

### Local Customizations
Add machine-specific configurations to `~/.zshrc.local` which won't be overwritten by updates.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License. See LICENCE file.
