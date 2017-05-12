#!/bin/bash

permission() {
  to_num() {
    local input="$1"
    local value=4
    local total=0
    for (( i=0; i<${#input}; i++ )); do
      local char=${input:$i:1}
      [ $char = 'r' ] && (( total+=4 ))
      [ $char = 'w' ] && (( total+=2 ))
      [ $char = 'x' ] && (( total+=1 ))
    done
    echo -n $total
  }
  to_char() {
    local input="$1"
    for (( k=0; k<${#input}; k++ )); do
      local num=${input:$k:1}
      (( $num & 4 )) && echo -n "r" || printf '-'
      (( $num & 2 )) && echo -n "w" || printf '-'
      (( $num & 1 )) && echo -n "x" || printf '-'
    done
  }
  local val="$1"
  if [[ "$val" =~ ([r\-][w\-][x\-]){3} ]]; then
    for (( j=0; j<${#val}; j+=3 )); do
      to_num "${val:$j:3}"
    done
    echo
  elif [[ "$val" =~ ([r\-][w\-][x\-]) ]] || [[ "$val" =~ [wrx]{1,3} ]]; then
    to_num "$val"
    echo
  elif [[ "$val" =~ [0-9]{3} ]]; then
    to_char "$val"
    echo
  elif [ $# -eq 0 ]; then
    cat <<-EOF
Usage:
  permission <arg>|<files...>


  arg can be a human readable permission (rwx format) or an octal permission
  the opposite will be printed.
EOF
    return 1
  else
    if [ $(uname) = "Darwin" ]; then
      echo "hahahahahahaha nope"
      return 1
    fi
    stat -c "%A %a %n" $@
  fi
}
