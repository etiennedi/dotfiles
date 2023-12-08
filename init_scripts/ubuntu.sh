#!/bin/bash

sudo apt update

function main() {
  echo_green 'Make vim the default editor'
  echo 'export EDITOR=vim' >> ~/.profile

  echo_green 'Download .vimrc from dotfiles'
  curl -Lo ~/.vimrc https://raw.githubusercontent.com/etiennedi/dotfiles/master/.vimrc

  echo_green 'Install vundle'
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  echo_green 'Install all vundle plugins'
  vim +PluginInstall +qall

  echo_green 'Install fzf'
  sudo apt install -y fzf

  echo_green 'Install ag (silverseracher)'
  sudo apt install -y silversearcher-ag

  echo_green 'Install Ctrl-R support for fzf'
  echo 'source /usr/share/doc/fzf/examples/key-bindings.bash' >> ~/.bashrc

  echo_green 'Install pip(3)'
  sudo apt install -y python3-pip

  echo_green 'Install Go'
  install_go

  echo_green 'Install Go binaries in vim'
  vim +GoInstallBinaries +qall

  echo_green 'Install Docker'
  install_docker

  echo_green 'Install GH CLI'
  install_gh

}

function install_go() {
        LATEST_GO_VERSION="$(curl --silent https://go.dev/VERSION?m=text | head -n 1)";
        LATEST_GO_DOWNLOAD_URL="https://go.dev/dl/${LATEST_GO_VERSION}.linux-amd64.tar.gz"

        ( mkdir -p /tmp/goinstaller && cd /tmp/goinstaller && curl -Lo go.tar.gz $LATEST_GO_DOWNLOAD_URL && \
                sudo  rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz && rm -rf /tmp/goinstaller )

        echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
}

function install_docker() {
        # Add Docker's official GPG key:
        sudo apt-get update
        sudo apt-get install -y ca-certificates curl gnupg
        sudo install -m 0755 -d /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        sudo chmod a+r /etc/apt/keyrings/docker.gpg

        # Add the repository to Apt sources:
        echo \
          "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
          $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
          sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update

        sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
        sudo usermod -aG docker $USER
}

function install_gh() {
  type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y

  echo 'Run "gh auth login", select HTTPS, and paste token'
}

function echo_green() {
  bold_green='\033[1;33m'
  nc='\033[0m'

  echo -e "${bold_green}${1}${nc}"
}

main

