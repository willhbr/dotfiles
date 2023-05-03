# Tmux completion (From Julius: github.com/Feh)
_tmux_pane_words() {
  local expl
  local -a w
  if [[ -z "$TMUX_PANE" ]]; then
    _message "not running inside tmux!"
    return 1
  fi
  w=( ${(u)=$(tmux capture-pane -J -p)} )
  _wanted values expl 'words from current tmux pane' compadd -a w
}
zle -C tmux-pane-words-prefix   complete-word _generic
zle -C tmux-pane-words-anywhere complete-word _generic
bindkey '^Xt' tmux-pane-words-prefix
bindkey '^X^X' tmux-pane-words-anywhere
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' completer _tmux_pane_words
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' ignore-line current
zstyle ':completion:tmux-pane-words-anywhere:*' matcher-list 'b:=* m:{A-Za-z}={a-zA-Z}'

zle -C hist-complete complete-word _generic
bindkey '^N'  hist-complete
zstyle ':completion:hist-complete:*' completer _history
zstyle ':completion:hist-complete:*' sort false # newest match first
zstyle ':completion:hist-complete:*' range 12000:8000
zstyle ':completion:hist-complete:*' matcher-list 'b:=*'
zstyle ':completion:hist-complete:*' remove-all-dups yes


zstyle ':completion:*:kill:argument-rest:*' command 'ps xf -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*:*:kill:argument-rest:processes' list-colors \
  '=(#b) #(<->) #<->.<->[ |\_]#([-/_[:alnum:][:digit:]]#)*=0=01;31=01;32'
zstyle ':completion:*:strace:option-p-1:*' command 'ps xf -u $USER -o pid,cmd'
zstyle ':completion:*:strace:option-p-1:option-p-1' list-colors \
  '=(#b) #(<->)[ |\_]#([-/_[:alnum:][:digit:]]#)*=0=01;31=01;32'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

__tmux-sessions() {
  local expl
  local -a sessions
  sessions=( $(mx) )
  _describe -t sessions 'sessions' sessions "$@"
}
compdef __tmux-sessions mx

__gcd-projects() {
  local expl
  local -a projects
  projects=( $(gcd --) )
  _describe -t projects 'projects' projects "$@"
}
compdef __gcd-projects gcd

__ssh_hosts() {
  local expl
  local -a hosts
  hosts=( $(grep -w -i "Host" ~/.ssh/config | sed 's/Host//') )
  _describe -t hosts 'hosts' hosts "$@"
}
compdef __ssh_hosts ssh

complete-or-list() {
  [[ $#BUFFER != 0 ]] && { zle complete-word ; return 0 }
  echo
  pwd
  ls
  zle reset-prompt
}
zle -N complete-or-list
bindkey '^I' complete-or-list
