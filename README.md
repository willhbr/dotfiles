# Will's Dotfiles

Config for `vim`, `tmux`, `zsh`, `bash`, `fish`, `irb`, `pry`, and `ptpython`.

Aim of this is to go from 0 to fully configured setup in one script.

## Tmux (custom) shortcuts

With Prefix (which is C-z):

v, h split vertical, horizontal

Without prefix:

`M-l`, `M-h` next/ previous window
`C-hjkl` navigate panes (and vim splits seamlessly)

## Vim custom shortcuts

`C-n`, `C-m` next, previous tab
`C-hjkl` navigate splits

`jj` to exit insert mode

## Shell commands

+ `gcd`: Go to or clone a git project in a regular structure
+ `mux`: Start or connect to a tmux session
+ `gmux`: Go to/ clone a project and then start a tmux session with that name

`mux` will look for a `.muxfile` in the root of the project to configure the tmux session
