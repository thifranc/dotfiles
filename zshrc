source ./secret


# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/bin:/sbin:/usr/local/bin:$PATH

HOME=/home/thibault
# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gianu"

plugins=(git copyfile)

export BASH_UTILS="$HOME/.bashUtils"

source $ZSH/oh-my-zsh.sh

if [ -d "$HOME/.bashUtils" ] && [ ! -z "$(ls -A $HOME/.bashUtils)" ]
then
for file in $BASH_UTILS/*; do
	if [ -f $file ]; then
		source "$file"
	fi
done
fi

alias ptestconf="bundle exec rspec --format documentation --color --pattern spec/classes/"
alias xd="xdg-open"
alias hist="history | grep"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias py="python "
alias internet="ping 8.8.8.8"
alias reload_path="export PATH=\$PATH"
alias appart="pbcopy < ~/appart.txt"

#alias octopuce
alias s="ssh -A -l root"
alias gr='grep -RniH --color '

export INFO_PATH=$HOME/Documents
export EDITOR=vim

#here begin the lines added by todo_list_github
export TODO_PATH=$HOME/todo
export INFO_PATH=$HOME/Documents
export SSH_PATH=$HOME/.ssh/id_rsa

	#export SSH_KEY=your_ssh_passphrase (optional)
	\. "${TODO_PATH}"/.todoCompletion
	source "${TODO_PATH}"/.todo.sh
	#here end the lines added by todo_list_github


	#new lines to enable Github auto-pulling
	source "${TODO_PATH}/.githubPulling.sh"
	if ! pgrep -x ssh-agent > /dev/null
	then
		sshConnect ${SSH_PATH} ${SSH_KEY}
		gitWatcher $TODO_PATH
		gitWatcher $INFO_PATH
	else
		echo git has already been updated
	fi
	#end of lines to enable Github auto-pulling
	
