set -x PATH $HOME/.bin /usr/local/bin

# Set up Go.
switch (uname -s)
	case Linux
    set -x GOROOT /usr/lib/go
  case Darwin
    set -x GOROOT /usr/local/Cellar/go/1.3.1/libexec
end
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# MySQL on OS X
if [ -d /usr/local/mysql ]
	set -x PATH $PATH /usr/local/mysql/bin
end
