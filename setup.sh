#!/usr/bin/env bash

# Setup my environment with the various dot files and such.
GITHUB_SETUP=1
MY_DOT_FILES=${HOME}/.my-dot-files
DATE=$(date +%y%m%d%H%M%S)
EMAIL="ahamilton55@gmail.com"
NAME="Andrew Hamilton"

GIT=$(which git)
YUM=$(which yum)

if [[ -z ${GIT} ]]; then
  sudo ${YUM} install -y git.x86_64
  GIT=$(which git)

  git config --global user.email "${EMAIL}"
  git config --global user.name "${NAME}"
fi

#RTN=$(ssh -T git@github.com)
#if [[ $RTN = "Hi ahamilton55! You've successfully authenticated, but GitHub does not provide shell access." ]]; then
#  GITHUB_SETUP=0
#else
#  echo "Please setup your ssh-keys and/or ssh-agent."
#fi

## Set my-dot-files repo
if [[ ! -d ${MY_DOT_FILES} ]]; then
  echo "Cloning my-dot-files repo"
  git clone git@github.com:ahamilton55/my-dot-files ${MY_DOT_FILES}
fi

## Setup ZSH
if [[ ! -f /bin/zsh ]]; then
  echo "ZSH doesn't seem to be installed. Installing it"
  sudo $YUM install -y zsh.x86_64
  chsh -s /bin/zsh
elif [[ ! $(cat /etc/passwd | grep ${USER} | awk -F':' '{print $7}') = '/bin/zsh' ]]; then
  echo "Changing the default shell from ${SHELL} to /bin/zsh"
  chsh -s /bin/zsh
else
  echo "ZSH is already installed"
fi

if [[ ! -d ${HOME}/.oh-my-zsh ]]; then
  echo "Clonging my version of oh-my-zsh"
  git clone git@github.com:ahamilton55/oh-my-zsh.git ${HOME}/.oh-my-zsh
else
  echo "oh-my-zsh already cloned."
fi

if [[ ! -e ${HOME}/.zshrc ]]; then
  echo "Setting up ${HOME}/.zshrc"
  ln -s ${MY_DOT_FILES}/zsh/.zshrc ${HOME}/.zshrc
elif [[ ! -L ${HOME}/.zshrc ]]; then
  echo "Setting up ${HOME}/.zshrc"
  mv ${HOME}/.zshrc ${MY_DOT_FILES}/old/.zshrc.${DATE}
  ln -s ${MY_DOT_FILES}/zsh/.zshrc ${HOME}/.zshrc
else
  echo ".zshrc has been setup"
fi

## Setup Vim
if [[ ! -f /usr/bin/vim ]]; then
  echo "Installing vim"
  sudo ${YUM} install -y vim-enhanced.x86_64
fi

if [[ -d ${HOME}/.vim ]]; then
  echo "Setting up ${HOME}/.vim"
  mv ${HOME}/.vim ${MY_DOT_FILES}/old/.vim.${DATE}
  ln -s ${MY_DOT_FILES}/vim/.vim ${HOME}/.vim
elif [[ ! -L ${HOME}/.vim ]]; then
  echo "Setting up ${HOME}/.vim"
  ln -s ${MY_DOT_FILES}/vim/.vim ${HOME}/.vim
else
  echo "Vim folder is already setup." 
fi

if [[ -f ${HOME}/.vimrc ]]; then
  echo "Setting up ${HOME}/.vimrc"
  mv ${HOME}/.vimrc ${MY_DOT_FILES}/old/.vimrc.${DATE}
  ln -s ${MY_DOT_FILES}/vim/.vimrc ${HOME}/.vimrc
elif [[ ! -L ${HOME}/.vimrc ]]; then
  echo "Setting up ${HOME}/.vimrc"
  ln -s ${MY_DOT_FILES}/vim/.vimrc ${HOME}/.vimrc
else
  echo "Vimrc file is already setup."
fi

echo "Completed"
