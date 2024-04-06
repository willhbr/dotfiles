# Zain's Config

It's well-tuned.

```shell
$ ./setup.sh
$ ./install.sh
```

## Install

install.sh on a new computer installs all dependencies needed by the shell.
./setup.sh symlinks all the dot files into the right places.

## Structure

`bash`          : Contains bash_profile
`bin`           : Custom command binaries to add to the PATH
`git`           : Git/jj config, aliases etc.
`shell`         : Enviornment variables, aliases etc.
`  /autoload`   : Each file here becomes a globally available function for use
                  in both other shell scripts and the CLI.
`  /installers` : No idea mate
`ssh`           : SSH config, just lists out prefered algorithms
`tmux`          : Tmux config
`zsh`           : Zsh + prompt config.

# Tricks

- `..` means go up a directory, each additional dot goes up another directory.
- `?? pattern file` greps
- `mx` has nice aliases for many tmux commands.
- `+x file` runs `chmod +x file`

