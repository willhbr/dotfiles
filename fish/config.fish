source /usr/local/share/chruby/chruby.fish
chruby 2.2.2

alias python="python3"
alias py="python3"
alias pip="pip3"
alias wget="curl -O"
alias gopi="gox -osarch=\"linux/arm\""
alias gos3="gox -osarch=\"linux/amd64\""
alias finder="open ."
alias ":q"="exit"
alias "tower"="gittower"

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

function fish_greeting
  # set_color $fish_color_comment
#   echo "                 ___"
#   echo "   ___======____=---=)"
#   echo " /T            \\_--===)"
#   echo " L \\ (0)   \\~    \\_-==)"
#   echo "  \\      / )J~~    \\-=)"
#   echo "   \\\\___/  )JJ~~    \\)"
#   echo "    \\_____/JJJ~~      \\"
#   echo "    / \\  , \\J~~~~      \\"
#   echo "   (-\\)\\=|  \\~~~        L__"
#   echo "   (\\\\)  ( -\\)_            ==__"
#   echo "    \\V    \\-\\) ===_____  J\\   \\\\"
#   echo "           \\V)     \\_) \\   JJ J\\)"
#   echo "                       /J JT\\JJJJ)"
#   echo "                       (JJJ| \\UUU)"
#   echo "                        (UU)"
#   set_color normal
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

function c
  gcc -std=c99 -Werror -Wall -g -o $argv[1] $argv[1].c
end

function mkcd
  mkdir -p $argv[1]
  cd $argv[1]
end
