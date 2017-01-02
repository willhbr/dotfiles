# assign a prompt color by hashing the letters of the hostname
# idea copied from the irssi script 'nickcolor.pl'
# Daniel Kertesz <daniel@spatof.org>

autoload -U colors
colors

setopt prompt_subst

colnames=(
  214 # Orange
  043 # Teal
  129 # Pink
  028 # Dark green
	green
	yellow
	blue
	magenta
	cyan
)

function _hostname_color() {
	local chash=0
	foreach letter ( ${(ws::)HOST[(ws:.:)1]} )
		(( chash += #letter ))
	end
	local crand=$(( $chash % $#colnames ))
	local crandname=$colnames[$crand]
  echo "%F{$colnames[$crand]}"
}
hostname_color=$(_hostname_color)
