. $HOME/.lib/fish/functions.fish
. $HOME/.lib/fish/paths.fish
. $HOME/.lib/fish/man-colors.fish
. $HOME/.lib/fish/ant-colors.fish
switch $TERM
	case screen-256color xterm xterm-256color
		. $HOME/.lib/fish/colors.fish
		. $HOME/.lib/fish/mvn-colors.fish
end
