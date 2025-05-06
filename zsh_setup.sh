#!/bin/bash

set -e

sudo apt update
# install zsh
sudo apt install -y zsh curl
# install oh-my-zsh
rm -rf ${HOME}/.oh-my-zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# set zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting zsh as default shell..."
    chsh -s $(which zsh)
fi


# cp the config to host
ZSHRC_FILE="${HOME}/.zshrc"
cp .zshrc $ZSHRC_FILE

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

if [ ! -d "$ZSH_CUSTOM/plugins" ]; then
  mkdir -p "$ZSH_CUSTOM/plugins"
fi

# install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

echo "zsh 安装配置完成"

exec zsh
