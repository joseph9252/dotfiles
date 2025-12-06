export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/Cellar/python@3.11/3.11.12/bin:$PATH"

# Default binary path
export PATH="/Users/josephhyunchung/bin:$PATH"

# add android studio path (only existing directories)
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/emulator

# Skip homebrew update
export HOMEBREW_NO_AUTO_UPDATE=1

# add terraform path
export PATH="$HOME/.tfenv/bin:$PATH"

export PATH="$(yarn global bin):$PATH"

# Load secrets from separate file (not tracked in git)
[ -f ~/.secrets ] && source ~/.secrets

# Go setup
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin

export NVM_DIR="$HOME/.nvm"
# Lazy load nvm for faster shell startup
if [ -s "$NVM_DIR/nvm.sh" ]; then
  # Add nvm's default node to PATH
  # Find the latest version matching the default alias
  NVM_DEFAULT_ALIAS=$(cat "$NVM_DIR/alias/default" 2>/dev/null || echo "22")
  NVM_DEFAULT_VERSION=$(ls "$NVM_DIR/versions/node" 2>/dev/null | grep "^v${NVM_DEFAULT_ALIAS}" | tail -1)
  if [ -n "$NVM_DEFAULT_VERSION" ]; then
    export PATH="$NVM_DIR/versions/node/$NVM_DEFAULT_VERSION/bin:$PATH"
  fi

  # Lazy load nvm when first called
  nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
  }

  # Also lazy load node, npm, and npx
  node() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    node "$@"
  }

  npm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    npm "$@"
  }

  npx() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    npx "$@"
  }
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/josephhyunchung/.oh-my-zsh"

ZSH_THEME="robbyrussell"

DEFAULT_USER=$USER
CASE_SENSITIVE="true"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

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
# For a full list of active aliases, run alias.
#

alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias branch="git branch"
alias b="branch"
alias status="git status"
alias s="status"
alias remote="git remote -v"
alias log="git log"
alias diff="git diff"
alias dev="git checkout develop"
alias amend="git commit --amend"
alias mp="git checkout master && git pull origin master"
alias dp="git checkout develop && git pull origin develop"
alias bp="git checkout base && git pull origin base"
alias add="git add ."
alias aa="add && amend"
alias run="./start.sh"
alias ys="yarn start"
alias yy="./start.sh --client internal --env dev --mode local"
alias ns="npm run start"
alias test="npm run test && npm run build && npm run lint"
alias ios="npm run ios"
alias android="yarn react-native run-android"
alias bb="git branch --show-current"
alias push="git push origin git branch --show-current"
alias pull="git pull origin git branch --show-current"
alias before="git checkout -"
alias killnode="killall -9 node"
alias docker="/Applications/Docker.app/Contents/Resources/bin/docker"
alias ddown="docker compose down"
alias dup="docker compose up -d"
alias bedndesk-db="ssh -N bedndesk-tunnel"
alias bedndesk-ec2="ssh -i ~/.ssh/bedndesk.pem ubuntu@43.201.73.20"
alias commit="commit-wrapper"
alias 8081="lsof -i :8081 | xargs kill -9 && npm run ios"
alias 3000="lsof -ti:3000 | xargs kill -9 && npm run dev"
alias expo="npx expo start --clear"
alias claude="claude --dangerously-skip-permissions"

# Custom functions for abbreviated commands
rebase () {
  bp
  git checkout -
  git rebase base
}

next () {
  nextBranch=git branch | grep -A1 \* | grep -v \* | xargs 
  if [ -z "$nextBranch" ]; then
    firstBranch=git branch | head -1 | xargs
    git checkout $firstBranch
  fi
  git checkout $nextBranch 
}

prev () {
  prevBranch=git branch | grep -B1 \* | grep -v \* | xargs 
  if [ -z "$prevBranch" ]; then
    lastBranch=git branch | tail -1 | xargs
    git checkout $lastBranch
  fi
  git checkout $prevBranch 
}

check () {
  count=git branch | grep -v \* | grep -c $1
  result=git branch | grep -v \* | grep $1 | xargs
  if [ $count -eq 0 ]
    then echo "Could not find any matching branch"
  elif [ $count -eq 1 ]
    then git checkout $result
  else
    echo "Found $count branch matches!"
    echo $result
  fi
}

clean () {
  if [ $1 = "branch" ]
    then git branch -D git branch | grep -v \* | grep -v "base" | grep -v "develop" | grep -v "master" | grep -v "dev" | grep -v "main" | xargs
  fi
}

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# nvm auto setup - disabled for faster shell startup
# Uncomment if you need auto node version switching
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local nvmrc_path="$(nvm_find_nvmrc)"
#
#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
#       nvm use
#     fi
#   elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# puppeteer
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=which chromium

export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

# OpenSSL 경로 설정
export PATH="/usr/local/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@3/lib/pkgconfig"

export PATH="$HOME/.local/bin:$PATH"
