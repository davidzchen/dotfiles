. $HOME/lib/fish/functions.fish
. $HOME/lib/fish/paths.fish
. $HOME/lib/fish/man-colors.fish
. $HOME/lib/fish/ant-colors.fish
switch $TERM
	case screen-256color xterm xterm-256color
		. $HOME/lib/fish/colors.fish
		. $HOME/lib/fish/mvn-colors.fish
		eval sh $HOME/lib/base16-shell/base16-ocean.dark.sh
end
