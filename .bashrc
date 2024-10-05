[[ $- != *i* ]] && return

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
  source /usr/share/git/completion/git-prompt.sh
elif [ -f /usr/share/git/git-prompt.sh ]; then
  source /usr/share/git/git-prompt.sh
fi

# Start the ssh-agent if not already running
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi

# Colours (from Catppuccin Mocha)
if [[ "$TERM" =~ "xterm"|"screen"|"tmux" ]]; then
  BLUE="\[\e[38;5;110m\]"  # #89B4FA
  MAUVE="\[\e[38;5;176m\]"  # #CBA6F7
  RESET="\[\e[0m\]"         # Reset color
fi

# Prompt setup
add_newline_if_not_clear() {
  if [[ $(history 1) != *" clear" ]]; then
    echo
  fi
}
PROMPT_COMMAND='add_newline_if_not_clear'
PS1="${BLUE}\w${MAUVE}\$(__git_ps1 ' (%s)')${RESET} \$ "

# Path settings for rbenv
if command -v rbenv &>/dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - bash)"
fi

# History settings
HISTSIZE=5000
HISTFILE=~/.bash_history
SAVEHIST=$HISTSIZE
shopt -s histappend
shopt -s cmdhist
shopt -s lithist
shopt -s histreedit
shopt -s histverify
HISTCONTROL=ignoreboth

# Aliases
alias ls='ls --color=auto'
alias la='ls -al --color=auto'
alias ll='ls -l --color=auto'
alias v='nvim'
alias kb='~/dotfiles/scripts/switch_keyboard_layout.sh'

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

export EDITOR=nvim
