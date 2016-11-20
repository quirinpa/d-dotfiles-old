set color
autoload -U colors && colors
# source $HOME/.dircolors.sh

alias ls="ls --color"
alias pacman="pacman --color=auto"
alias dmesg="dmesg --color"
# alias pal="pal --color"

setopt NO_PROMPT_SUBST NO_CORRECT

# ZLE_PROMPT_INDENT=0
user_at_host="$USER@$HOST "

TRAPZERR() { new_errorcode="%F{red}$? " }

color() {
	echo -n %F{$1}
}

get_git_color() {
	local total=`git status --porcelain|wc -l`

	if [ $total -gt 0 ]; then
		local staged=`git diff --cached --numstat | wc -l`

		if [[ $staged == $total ]]; then
			color 2
		else
			[ $staged -gt 0 ] && color 3 || color 1
		fi
	else
		color 15
	fi
}

init_git() {
	branch=`git branch 2>/dev/null | grep \* | cut -c3-`
	[ -z $branch ] && {
		# in case new_git_status isn't reset all the time
		git_directory="shouldnotexist"
		new_git_status=
	} || {
		git_directory=`git rev-parse --show-toplevel 2>/dev/null`
		git_color=`get_git_color`
		new_git_status=$git_color$branch\ 
	}
}

chpwd() {
	new_pwd="%F{white}${PWD/$HOME/~} "

	[[ $PWD == "$git_directory"* ]] || init_git
}
git_directory="shouldnotexist"
chpwd

preexec() {
	[ -z $branch ] || case $1 in
		git*)
			case $(echo $1 | cut -d " " -f2) in
				commit*|checkout*|add*|rm*|cp*|pull*) check_git_changes=1;;
				*) check_git_changes=;;
			esac;;
		rm*|touch*|$EDITOR*) check_git_changes=1;;
		*) check_git_changes=;;
	esac
}

precmd(){
	if [ ! -z $check_git_changes ]; then
		local new_git_color=`get_git_color`
		[[ "$new_git_color" != "$git_color" ]] &&
			git_color=$new_git_color &&
			new_git_status=$git_color$branch\ 
		check_git_changes=
	fi

	OPROMPT=$new_errorcode$user_at_host$new_pwd$new_git_status
	PROMPT="$OPROMPT`color 12`%#%f "
	user_at_host=
	new_errorcode=
	# new_git_status=
	# new_pwd=
}

bindkey -v
zle -N zle-keymap-select
zle-keymap-select() {
	PROMPT="$OPROMPT`[[ $KEYMAP == vicmd ]] && color 13 || color 12`%#%f "
	zle reset-prompt
}

bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^R" history-incremental-search-backward

KEYTIMEOUT=1

HISTSIZE=3000; SAVEHIST=3000
HISTFILE=$HOME/.zsh_history

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:default' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
