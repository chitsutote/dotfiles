# set visual editor to vim
# we can use c-x c-e to edit bash command in text editor
export VISUAL=vim

#Set terminal 256 color
export	TERM=xterm-256color

# Tig aliases
alias tis='tig status'

# Git aliases
alias gst='git status'
alias grp='git remote update origin -p'
alias gph='git push origin HEAD'
alias gck='git checkout'
# clean all merged local branches
# git branch --merged: show all merged branches
# egrep -v "(^\*|master|dev)": exclude master, dev, and branch you current at
# xargs git branch -d: delete it
alias gclean='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'


#show git branch
function git_branch {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
	echo "("${ref#refs/heads/}") ";
}
 
#show git last commit time
function git_since_last_commit {
	now=`date +%s`;
	last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
	seconds_since_last_commit=$((now-last_commit));
	minutes_since_last_commit=$((seconds_since_last_commit/60));
	hours_since_last_commit=$((minutes_since_last_commit/60));
	minutes_since_last_commit=$((minutes_since_last_commit%60));
	echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

# print full path
#  PS1="[\[\033[1;32m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ " 

# only print current folder
PS1="[\[\033[1;32m\]\W\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ " 

# auto read nvmrc if found
# use default if not found
enter_directory() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  PREV_PWD=$PWD
	if [[ -f ".nvmrc" ]]; then
    nvm use
    NVM_DIRTY=true
	elif [[ $NVM_DIRTY = true ]]; then
    nvm use default
    NVM_DIRTY=false
	fi
}

export PROMPT_COMMAND=enter_directory
