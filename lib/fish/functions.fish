function grep
	command grep --color $argv
end

function egrep
	command grep --color $argv
end

function fgrep
	command grep --color $argv
end

function va
	command vim -u ~/.vimrc.more $argv
end

function fish_greeting
	~/bin/begin
end
