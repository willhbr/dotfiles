# assign a prompt color by hashing the letters of the hostname
# idea copied from the irssi script 'nickcolor.pl'
# Daniel Kertesz <daniel@spatof.org>
# Translated to be bash compatible

colnames=(
  010 # Green
  005 # Magenta
  011 # Yellow
  012 # Blue
  014 # Cyan
  028 # Dark green
  043 # Teal
  129 # Pink
  214 # Orange
)

ord() {
  printf '%d' "'$1"
}

function _hostname_color() {
	local chash=0
  local hostname=$(hostname -s)
  for (( i=0; i<${#hostname}; i++ )); do
    char=$(ord ${hostname:$i:1})
    ((chash=$chash^$char))
  done
  local crand=$(($chash % ${#colnames}))
  if [ -z "$BASH" ]; then ((crand++)); fi
  hostname_color=${colnames[$crand]}
}
_hostname_color
