. $HOME/.dots/fish/functions.fish
. $HOME/.dots/fish/paths.fish
. $HOME/.dots/fish/man-colors.fish
. $HOME/.dots/fish/ant-colors.fish
switch $TERM
	case screen-256color xterm xterm-256color
		. $HOME/.dots/fish/colors.fish
		. $HOME/.dots/fish/mvn-colors.fish
end
