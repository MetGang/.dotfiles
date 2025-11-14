# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Default editor
export EDITOR=vim
export VISUAL=vim

# History options
export HISTCONTROL=ignoreboth
export HISTSIZE=8192
export HISTFILESIZE=16384
shopt -s histappend

# Window size management
shopt -s checkwinsize

# Setup PATH
function path-prepend() {
  if ! echo $PATH | /bin/grep -qE "(^|:)$1($|:)"; then
    PATH=$1:$PATH
  fi
}

function path-append() {
  if ! echo $PATH | /bin/grep -qE "(^|:)$1($|:)"; then
    PATH=$PATH:$1
  fi
}

# Alias definitions
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Setup fzf
[ -f ~/.fzf.bash ] && . ~/.fzf.bash

# Prompt
is_not_msys() {
  [[ "$(uname -o 2>/dev/null)" != "Msys" ]] && [[ "$MSYSTEM" != "MINGW64" ]] && [[ "$MSYSTEM" != "MINGW32" ]]
}

if is_not_msys; then
  PS1='\[\e[96m\]\t\[\e[0m\] \[\e[92m\]\u\[\e[92m\]@\[\e[92m\]\h\[\e[0m\] \[\e[94m\]\w\[\e[0m\] \[\e[90m\]\$\[\e[0m\] '
fi

# Extras
[ -f ~/.bash_extra ] && . ~/.bash_extra
