function grep
	grep --color $argv
end

function egrep
	grep --color $argv
end

function fgrep
	grep --color $argv
end

function va
	vim -u ~/.vimrc.more
end

function fish_greeting
	~/bin/begin
end
