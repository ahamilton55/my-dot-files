# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# AWS CLI autocompleter
if [[ -e /usr/bin/aws_zsh_completer.sh ]]; then
  source /usr/bin/aws_zsh_completer.sh
elif [[ -e /usr/local/bin/aws_zsh_completer.sh ]]; then
  source /usr/local/bin/aws_zsh_completer.sh
fi

# Configure AWS credentials
if [[ -f ${HOME}/.prevoty_aws ]]; then
  source ${HOME}/.prevoty_aws
fi

if [[ -f ~/.ec2/planet_express.aws ]]; then
  export AWS_CONFIG_FILE=~/.ec2/planet_express.aws
fi

# Configure Go stuff
if [[ -d /usr/local/go ]]; then
  export GOROOT=/usr/local/go

  if [[ -d $HOME/go ]]; then
    export GOPATH=$HOME/go
  fi
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# Setup ansible source if it exists
if [[ -d ${HOME}/workspace/ansible ]]; then
  source ${HOME}/workspace/ansible/hacking/env-setup &>/dev/null
fi

if [[ -f ${HOME}/.prevoty_aws ]]; then
  source ${HOME}/.prevoty_aws
  export EC2_INI_PATH=/Users/andrew/workspace/deploy/deploy_conf/ec2.ini
  export ANSIBLE_CONFIG=/Users/andrew/workspace/deploy/deploy_conf/ansible.cfg
  if [[ -n $ANSIBLE_LIBRARY ]]; then
    export ANSIBLE_LIBRARY=$ANSIBLE_LIBRARY:${HOME}/workspace/deploy/modules/
  else
    export ANSIBLE_LIBRARY=${HOME}/workspace/deploy/modules/
  fi

fi

if [[ -d /usr/local/share/python ]]; then
  export PATH=${PATH}:/usr/local/share/python
fi

if [[ -f /usr/local/bin/vim ]]; then
  alias vim=/usr/local/bin/vim
  export EDITOR=/usr/local/bin/vim
fi

if [[ $(uname -s) == "Darwin" ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
  export PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Library
fi
