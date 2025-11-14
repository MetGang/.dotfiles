alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -l'
alias la='ls -lA'

alias cp='cp -vi'
alias mv='mv -vi'

alias cpv='rsync -avh --info=progress2'

alias tmux='tmux -u'

alias ppath='echo $PATH | sed s/:/\\n/g'

if ! command -v bat >/dev/null 2>&1 && command -v batcat >/dev/null 2>&1; then
  alias bat='batcat'
fi

ftxt () {
  grep -iIHrn --color=always "$2" "$1" | less -R
}

y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
