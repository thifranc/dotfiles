# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/moi/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git copyfile)

export BASH_UTILS="/home/moi/.bashUtils"

source $ZSH/oh-my-zsh.sh

for file in $BASH_UTILS/*; do
	if [ -f $file ]; then
		source "$file"
	fi
done

alias xd="xdg-open"
alias hist="history | grep"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias py="python "
alias internet="ping 8.8.8.8"
alias reload_path="export PATH=\$PATH"
alias appart="pbcopy < ~/appart.txt"
export INFO_PATH=/home/moi/Documents
export EDITOR=vim

#here begin the lines added by todo_list_github
export TODO_PATH=/home/moi/todo
export SSH_PATH=/home/moi/.ssh/nouvo

	#export SSH_KEY=passphrase
	autoload bashcompinit
	bashcompinit
	source "${TODO_PATH}"/.todoCompletion
	source "${TODO_PATH}"/.todo.sh
	#here end the lines added by todo_list_github


	source "${TODO_PATH}/.githubPulling.sh"
	if ! pgrep -x ssh-agent > /dev/null
	then
		eval `ssh-agent`
		#sshConnect ${SSH_PATH} ${SSH_KEY}
		gitWatcher $TODO_PATH
		gitWatcher $INFO_PATH
	else
		echo git has already been updated
	fi
	
