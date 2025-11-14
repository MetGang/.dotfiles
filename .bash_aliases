alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -l'
alias la='ls -lA'

alias cp='cp -vi'
alias mv='mv -vi'

alias cpv='rsync -avh --info=progress2'

alias tmux='tmux -u'

alias ppath='echo $PATH | sed s/:/\\n/g'

ftxt () {
  grep -iIHrn --color=always "$2" "$1" | less -r
}

y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
