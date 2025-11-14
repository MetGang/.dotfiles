# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# History options
HISTCONTROL=ignoreboth
HISTSIZE=1024
HISTFILESIZE=2048
shopt -s histappend

# Window size management
shopt -s checkwinsize

# Setup PATH
function path-prepend() {
  if ! echo $PATH | /bin/grep -qE "(^|:)$1($|:)" ; then
    PATH=$1:$PATH
  fi
}

function path-append() {
  if ! echo $PATH | /bin/grep -qE "(^|:)$1($|:)" ; then
    PATH=$PATH:$1
  fi
}

# Set default editor
export EDITOR=vim
export VISUAL=vim

# Completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Alias definitions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Setup fzf
[ -f ~/.fzf.bash ] && . ~/.fzf.bash

# Prompt
is_not_msys() {
  [[ "$(uname -o 2>/dev/null)" != "Msys" ]] && [[ "$MSYSTEM" != "MINGW64" ]] && [[ "$MSYSTEM" != "MINGW32" ]]
}

if is_not_msys; then
  PS1='\[\e[92m\]\u@\h\[\e[0m\] \[\e[96m\]\t\[\e[0m\] \[\e[94m\]\w\[\e[0m\] \[\e[90m\]\$\[\e[0m\] '
fi
