
#Set terminal 256 color
export	TERM=xterm-256color

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
