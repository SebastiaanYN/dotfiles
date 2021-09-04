#!/bin/bash

function yes_no() {
    read -p "$1 (y/n)? " -n 1 -r
    echo

    if [[ $REPLY =~ ^[yY]$ ]]; then
        return 0
    else
        return 1
    fi
}

yes_no "Install zsh" && sudo apt install zsh
echo

echo "Zsh version:"
zsh --version
echo

yes_no "Make zsh default shell" && chsh -s $(which zsh)
echo

yes_no "Install Oh My Zsh" && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo

ZSH=${ZSH:-$HOME/.oh-my-zsh}
ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}

yes_no "Install powerlevel10k" && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
echo

yes_no "Install zsh dependencies" && {
    sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
    sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
}
echo

yes_no "Symlink dotfiles" && {
    ln -sf $PWD/.zshrc $HOME/.zshrc
    ln -sf $PWD/.p10k.zsh $HOME/.p10k.zsh
}
echo

yes_no "Copy cron jobs" && {
    sudo cp $PWD/cron.d/* /etc/cron.d
}
echo

echo "Finished!"
