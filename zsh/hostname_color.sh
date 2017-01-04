# assign a prompt color by hashing the letters of the hostname
# idea copied from the irssi script 'nickcolor.pl'
# Daniel Kertesz <daniel@spatof.org>
# Translated to be bash compatible

colnames=(
  214 # Orange
  043 # Teal
  129 # Pink
  028 # Dark green
	010 # Green
  011 # Yellow
  012 # Blue
  005 # Magenta
  014 # Cyan
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
  hostname_color=${colnames[$crand]}
}
_hostname_color
