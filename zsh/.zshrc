# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="blinks"
ZSH_THEME="blinks-custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

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
  awscli_dir=$(find /usr/local/Cellar/awscli -type d -depth 1 | sort -n | tail -1)
  source ${awscli_dir}/libexec/bin/aws_zsh_completer.sh
fi

if [[ -f ~/.ec2/planet_express.aws ]]; then
  export AWS_CONFIG_FILE=~/.ec2/planet_express.aws
fi

# Configure Go stuff
if [[ -d /usr/local/go ]]; then
  export GOROOT=/usr/local/go
  export PATH=$PATH:$GOROOT/bin
elif [[ -d /usr/lib/go ]]; then
  export GOROOT=/usr/lib/go
  export PATH=$PATH:$GOROOT/bin
fi

if [[ -d $HOME/go ]]; then
  export GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$PATH
fi

# Setup ansible source if it exists
if [[ -d ${HOME}/workspace/ansible ]]; then
  source ${HOME}/workspace/ansible/hacking/env-setup &>/dev/null
fi

if [[ -f /usr/local/bin/vim ]]; then
  alias vim=/usr/local/bin/vim
  export EDITOR=/usr/local/bin/vim
else
  export EDITOR=$(which vim)
fi

if [[ -d $HOME/bin ]]; then
  export PATH=${HOME}/bin:${PATH}
fi

if [[ -f ${HOME}/.work_env ]]; then
  source ${HOME}/.work_env
fi

[[ -x /usr/libexec/path_helper ]] && eval $(/usr/libexec/path_helper -s)

gpg-agent --daemon &>/dev/null

if [[ "$(uname -s)" == "Darwin" ]]; then
  export SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh
else
#  #if [ -f "${HOME}/.gpg-agent-info" ]; then
#  #  source "${HOME}/.gpg-agent-info"
#  #  export GPG_AGENT_INFO
#  #  export SSH_AUTH_SOCK
#  #  export SSH_AGENT_PID
#  #else
#  if [[ ! $(ps aux | grep gpg-agent | grep -v grep | grep gpg-agent) ]]; then
#    $( gpg-agent --daemon >${HOME}/.gpg-agent-info )
#    source "${HOME}/.gpg-agent-info"
#  else
#    source "${HOME}/.gpg-agent-info"
#  fi
  unset SSH_AGENT_PID
  if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
  fi

  # Set GPG TTY
  export GPG_TTY=$(tty)

  # Refresh gpg-agent tty in case user switches into an X session
  gpg-connect-agent updatestartuptty /bye >/dev/null
fi

if [[ -f ~/.local_settings ]]; then
  source ~/.local_settings
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
