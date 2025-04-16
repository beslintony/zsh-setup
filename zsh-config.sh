#!/bin/bash

# Script to install Zsh with Oh My Zsh, auto-completion, syntax highlighting
# and set half-life theme as default with additional productivity enhancements

# Exit on any error
set -e

echo "Starting Zsh and Oh My Zsh installation..."

# Check if zsh is already installed
if ! command -v zsh &> /dev/null; then
    echo "Installing Zsh..."
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install -y zsh
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y zsh
    elif command -v yum &> /dev/null; then
        sudo yum install -y zsh
    elif command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm zsh
    elif command -v brew &> /dev/null; then
        brew install zsh
    else
        echo "Error: Package manager not found. Please install Zsh manually."
        exit 1
    fi
    echo "Zsh installed successfully."
else
    echo "Zsh is already installed."
fi

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "Oh My Zsh installed successfully."
else
    echo "Oh My Zsh is already installed."
fi

# Install Zsh plugins
echo "Installing Zsh plugins..."

# Install zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "zsh-syntax-highlighting installed."
else
    echo "zsh-syntax-highlighting is already installed."
fi

# Install zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo "zsh-autosuggestions installed."
else
    echo "zsh-autosuggestions is already installed."
fi

# Create backup of existing .zshrc if it exists
if [ -f "$HOME/.zshrc" ]; then
    echo "Creating backup of existing .zshrc..."
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d%H%M%S)"
fi

# Configure .zshrc with theme and plugins
echo "Configuring .zshrc with half-life theme and plugins..."
cat > "$HOME/.zshrc" << 'EOL'
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme
ZSH_THEME="half-life"

# Set list of plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  command-not-found
  sudo
  history
  copypath
  copybuffer
  docker
  npm
  pip
  web-search
  extract
  z
  dirhistory
  jsontools
  colored-man-pages
  vscode
  tmux
  fzf
  thefuck
  zsh-interactive-cd
  zsh-navigation-tools
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# History configuration
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY # Save timestamp
setopt INC_APPEND_HISTORY # Add commands as they are typed, not at shell exit

# Directory navigation
setopt AUTO_CD
setopt AUTO_PUSHD # Make cd push the old directory onto the directory stack
setopt PUSHD_IGNORE_DUPS # Don't push multiple copies of the same directory onto the stack
setopt PUSHD_SILENT # Don't print the directory stack after pushd or popd

# Enable correction
setopt CORRECT
setopt CORRECT_ALL

# Setup dircolors if it exists
if [ -x "$(command -v dircolors)" ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Add colors to man pages
export LESS_TERMCAP_mb=
EOL

# Make Zsh the default shell
echo "Setting Zsh as the default shell..."
current_shell=$(getent passwd $USER | cut -d: -f7)
if [ "$current_shell" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "Zsh is now your default shell."
else
    echo "Zsh is already your default shell."
fi

echo "Installation complete! Please log out and log back in for changes to take effect."
echo "If you want to apply changes without logging out, run: exec zsh"

# Display some useful information
echo ""
echo "==== ZSH SETUP COMPLETE ===="
echo "Theme: half-life (Powerlevel10k also installed as an alternative)"
echo "To switch to Powerlevel10k, edit ~/.zshrc and change ZSH_THEME to \"powerlevel10k/powerlevel10k\""
echo ""
echo "Useful shortcuts and features:"
echo "- Press Tab for completion"
echo "- Type part of a command and press ↑/↓ to search history"
echo "- Ctrl+R for fuzzy history search"
echo "- Type a directory name to cd into it automatically"
echo "- Use z [pattern] to jump to frequently used directories"
echo "- Use extract [archive] to extract any archive"
echo "- Use the 'fuck' command to correct previous command errors"
echo "- More tips in the ~/.zshrc file"
echo ""
echo "Enjoy your enhanced terminal experience!"
\E[01;31m'
export LESS_TERMCAP_md=
EOL

# Make Zsh the default shell
echo "Setting Zsh as the default shell..."
current_shell=$(getent passwd $USER | cut -d: -f7)
if [ "$current_shell" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "Zsh is now your default shell."
else
    echo "Zsh is already your default shell."
fi

echo "Installation complete! Please log out and log back in for changes to take effect."
echo "If you want to apply changes without logging out, run: exec zsh"
\E[01;31m'
export LESS_TERMCAP_me=
EOL

# Make Zsh the default shell
echo "Setting Zsh as the default shell..."
current_shell=$(getent passwd $USER | cut -d: -f7)
if [ "$current_shell" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "Zsh is now your default shell."
else
    echo "Zsh is already your default shell."
fi

echo "Installation complete! Please log out and log back in for changes to take effect."
echo "If you want to apply changes without logging out, run: exec zsh"
\E[0m'
export LESS_TERMCAP_se=
EOL

# Make Zsh the default shell
echo "Setting Zsh as the default shell..."
current_shell=$(getent passwd $USER | cut -d: -f7)
if [ "$current_shell" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "Zsh is now your default shell."
else
    echo "Zsh is already your default shell."
fi

echo "Installation complete! Please log out and log back in for changes to take effect."
echo "If you want to apply changes without logging out, run: exec zsh"
\E[0m'
export LESS_TERMCAP_so=
EOL

# Make Zsh the default shell
echo "Setting Zsh as the default shell..."
current_shell=$(getent passwd $USER | cut -d: -f7)
if [ "$current_shell" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "Zsh is now your default shell."
else
    echo "Zsh is already your default shell."
fi

echo "Installation complete! Please log out and log back in for changes to take effect."
echo "If you want to apply changes without logging out, run: exec zsh"
\E[01;44;33m'
export LESS_TERMCAP_ue=
EOL

# Make Zsh the default shell
echo "Setting Zsh as the default shell..."
current_shell=$(getent passwd $USER | cut -d: -f7)
if [ "$current_shell" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "Zsh is now your default shell."
else
    echo "Zsh is already your default shell."
fi

echo "Installation complete! Please log out and log back in for changes to take effect."
echo "If you want to apply changes without logging out, run: exec zsh"
\E[0m'
export LESS_TERMCAP_us=
EOL

# Make Zsh the default shell
echo "Setting Zsh as the default shell..."
current_shell=$(getent passwd $USER | cut -d: -f7)
if [ "$current_shell" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "Zsh is now your default shell."
else
    echo "Zsh is already your default shell."
fi

echo "Installation complete! Please log out and log back in for changes to take effect."
echo "If you want to apply changes without logging out, run: exec zsh"
\E[01;32m'

# Custom aliases
alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias ll="ls -la"
alias la="ls -a"
alias l="ls -l"
alias c="clear"
alias h="history"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias update="sudo apt update && sudo apt upgrade -y"
alias df="df -h"
alias du="du -h"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias ping="ping -c 5"
alias top="htop"
alias myip="curl -s http://ipinfo.io/ip"
alias weather="curl -s wttr.in/?0"
alias ports="netstat -tulanp"
alias meminfo="free -m -l -t"
alias cpuinfo="lscpu"
alias sysinfo="neofetch"
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias path='echo -e ${PATH//:/\\n}'

# Git aliases
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gs="git status"
alias gl="git log --oneline --graph --decorate"
alias gd="git diff"
alias gb="git branch"
alias gco="git checkout"
alias gf="git fetch"
alias gm="git merge"
alias gr="git rebase"
alias gpu="git pull"

# Python virtual environment aliases
alias venv="python -m venv .venv"
alias activate="source .venv/bin/activate"

# Docker aliases
alias dps="docker ps"
alias di="docker images"
alias dexec="docker exec -it"
alias dlogs="docker logs"
alias dstop="docker stop"
alias drm="docker rm"
alias drmi="docker rmi"
alias dc="docker-compose"

# Setup 'thefuck' alias if installed
if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

# Add FZF for history search with CTRL+R if installed
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add syntax highlighting styles
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow,bold'

# Custom functions

# Create a directory and cd into it
mcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract various archive types
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Search through bash history
hg() {
  history | grep "$1"
}

# Find file by name
ff() {
  find . -type f -name "*$1*"
}

# Find directory by name
fd() {
  find . -type d -name "*$1*"
}

# Create backup of a file
bak() {
  cp "$1"{,.bak}
}

# Load local configurations if they exist
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
EOL

# Make Zsh the default shell
echo "Setting Zsh as the default shell..."
current_shell=$(getent passwd $USER | cut -d: -f7)
if [ "$current_shell" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
    echo "Zsh is now your default shell."
else
    echo "Zsh is already your default shell."
fi

echo "Installation complete! Please log out and log back in for changes to take effect."
echo "If you want to apply changes without logging out, run: exec zsh"
