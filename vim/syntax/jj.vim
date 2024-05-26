if exists('b:current_syntax')
  finish
endif

syn region JJComment start="JJ: " end="$"
hi def link JJComment Comment

let b:current_syntax = 'jj'
