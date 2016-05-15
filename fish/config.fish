source /usr/local/share/chruby/chruby.fish
chruby 2.3.1

alias python="python3"
alias py="python3"
alias pip="pip3"
alias wget="curl -O"
alias gopi="gox -osarch=\"linux/arm\""
alias gos3="gox -osarch=\"linux/amd64\""
alias finder="open ."
alias ":q"="exit"
alias "tower"="gittower"
alias em="emacs"
alias redis="redis-cli"
alias rmate="ssh -R 52698:localhost:52698"

set PATH "/Users/will/src/sdk/platform-tools /usr/local/opt/openssl/bin /usr/local/heroku/bin /usr/local/bin /Library/Frameworks/Python.framework/Versions/3.4/bin" $PATH
set PATH "/Users/will/Dropbox/golang/bin" $PATH
set GOPATH "/Users/will/Dropbox/golang"

function fish_prompt
  if [ $status = 0 ]
    set_color green
    if git rev-parse 2> /dev/null
      echo -n (git rev-parse --abbrev-ref HEAD)
    else
      echo -n "^_^"
    end
  else
    set_color red
    if git rev-parse 2> /dev/null
      echo -n (git rev-parse --abbrev-ref HEAD)
    else
      echo -n "x_x"
    end
  end
  set_color normal
  echo -n ' ('
  echo -n (prompt_pwd)
  echo -n ') '
end

function db
	if [ "$argv[1]" = "mysql" ]
	  mysql.server $argv[2]
	else
	  if [ "$argv[1]" = "pg" ]
      if [ "$argv[2]" = "start" ]
        pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
      else
        pg_ctl -D /usr/local/var/postgres stop -s -m fast
      end
    end
  end
end

function fish_greeting
end

function start
  if [ "$argv[1]" = "mysql" ]
    db mysql start
  else
    if [ "$argv[1]" = "pg" ]
      db pg start
    end
  end
end

function stop
  if [ "$argv[1]" = "mysql" ]
    db mysql stop
  else
    if [ "$argv[1]" = "pg" ]
      db pg stop
    end
  end
end

function c
  gcc -std=c99 -Werror -Wall -g -o $argv[1] $argv[1].c
end

function mkcd
  mkdir -p $argv[1]
  cd $argv[1]
end

function pryc
  pry -r ./config/environment
end

# this is a terrible name
function pyc
  py "/Library/Frameworks/Python.framework/Versions/3.5/lib/python3.5/site-packages/ptpython/entry_points/run_ptpython.py"
end

setenv SWIFTENV_ROOT "$HOME/.swiftenv"
setenv PATH "$SWIFTENV_ROOT/bin" $PATH
status --is-interactive; and . (swiftenv init -|psub)
