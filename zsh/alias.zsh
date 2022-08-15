for mode in +x -x +r -r +w -r 777 755; do
  eval "$mode() { chmod $mode \"\$@\" }"
done
alias -g CL=" | wc -l"
alias -g CC=" | wc -c"
alias -g LESS=" | less"
alias -g ::=" ; send_tmux_message "
alias -g '??'=" | grep"

local short='...'
local long='../..'
for dots in {1..10}; do
  alias -g $short=$long
  short="${short}."
  long="$long/.."
done
