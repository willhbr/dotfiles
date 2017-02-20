# assign a prompt color by hashing the letters of the hostname
# idea copied from the irssi script 'nickcolor.pl'
# Daniel Kertesz <daniel@spatof.org>
# Translated to be bash compatible

colnames=(
  75  # light_blue
  71  # green
  229 # yellow
  143 # blue
  30  # turquoise
  73  # cyan
  175 # pink
  143 # khaki
  75  # cursor_blue
)

_hostname_color() {
  ord() {
    printf '%d' "'$1"
  }

  local chash=0
  local hostname=$(hostname -s)
  for (( i=0; i<${#hostname}; i++ )); do
    char=$(ord ${hostname:$i:1})
    ((chash=$chash^$char))
  done
  ((chash=$chash^${#hostname}))
  local crand=$(($chash % ${#colnames}))
  if [ -z "$BASH" ]; then ((crand++)); fi
  hostname_color=${colnames[$crand]}
}
_hostname_color
