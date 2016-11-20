ZDOTDIR=$HOME/.zsh

export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"

PATH="$HOME/bin:$HOME/.gem/ruby/2.3.0/bin:$PATH"

[ $HOST = "qant" ] &&
	export qpair="qbit" ||
	export qpair="qant"

export syncr() {
	local rpath=`realpath $1`
	local rdate=`ssh $qpair "stat -c %Y $rpath"`
	[ "$rdate" -ge "`stat -c %Y $1`" ] && return 1
	scp $1 $qpair:$rpath
}

export diffr() {
	ssh $qpair "cat `realpath $1`" | colordiff - $1
}

export EDITOR=vim
export BROWSER=lynx
export GBROWSER=surf

export srg() {
	BROWSER=$GBROWSER sr $(sr -elvi | awk '{print $1}' | dmenu -p sr)
}

export bmarks() {
	BMARKS_FILE=$HOME/.config/surfraw/bookmarks
	local chosen=`cat $BMARKS_FILE | awk '{print $1}' | dmenu`
	local site=`cat $BMARKS_FILE | grep -e "^$chosen" | awk '{print $2}'`
	$BROWSER $site
}

export mailprint() {
	mutt 698adwu822eja@hpeprint.com -a $1 </dev/null
}

export trash() {
	mv $1 $HOME/.trash
}

export CPATH="$HOME/include"

alias termbin="nc termbin.com 9999"
alias g="sr google"
