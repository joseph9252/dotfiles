# Default binary path


export PATH="/Users/josephhyunchung/bin:$PATH"

# Skip homebrew update
export HOMEBREW_NO_AUTO_UPDATE=1

# add terraform path
export PATH="$PATH:~/"
export PATH="$HOME/.tfenv/bin:$PATH"

export PATH="$PATH:/opt/yarn-[version]/bin"
export PATH="$(yarn global bin):$PATH"

# add conda path
export PATH="/usr/local/anaconda3/bin:$PATH"

# Jira credentials
export JIRA_TOKEN=Uhz1WjGqxlFwrfy4phiC62CF
export JIRA_EMAIL=karl@salesboost.ai
export JIRA_PROJECT_KEY=SB
export JIRA_ENDPOINT=https://salesboost.atlassian.net/rest

# Github credentials
export GITHUB_ACCESS_TOKEN=51bfb41affa9d7159aca27e71f205db2899596a8

# Go setup
export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Path to your oh-my-zsh installation.
export ZSH="/Users/josephhyunchung/.oh-my-zsh"

ZSH_THEME="agnoster"

DEFAULT_USER=$USER
CASE_SENSITIVE="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias branch="git branch"
alias b="branch"
alias pull="git pull upstream dev"
alias status="git status"
alias s="status"
alias remote="git remote -v"
alias log="git log"
alias diff="git diff"
alias d="git diff"
alias amend="git commit --amend"
alias dp="git checkout dev && pull"
alias add="git add ."
alias aa="add && amend"
alias nd="npm run dev"
alias ys="yarn start"
alias test="npm run test && npm run build && npm run lint"
alias ios="yarn react-native run-ios"
alias android="yarn react-native run-android"

# Custom functions for abbreviated commands
tsnode () {
	if [ "$1" == "" ]
    then
		npx ts-node
	elif [ "$1" == "command" ]
	then
		echo "npx ts-node"
    else
		npx ts-node $1
	fi
}
