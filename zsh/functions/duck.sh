#!/bin/bash

duck() {
  message="$1"
  [ -z "$message" ] && message="Duck!"
cat <<- EOF
     ___
 ___( o )>  $(echo "$message" | xargs)
 \ <_. )
  \`---'
EOF
}
