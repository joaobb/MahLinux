#!/bin/bash

echo === Installing ZSH ===
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo === Setting ZSH up ===

echo ZSH_THEME=aussiegeek >> ~/.zshrc

echo "plugins=(
        git
        zsh-autosuggestions
)" >>~/.zshrc

echo "
# -- General --
alias pls='sudo'
alias sugo='sudo'
alias grep='grep --color'
alias cl='clear'

op() {
    if [[ $1 == '' ]] 
    then
	xdg-open ./ >/dev/null 2>&1 
    else
	xdg-open "$1" >/dev/null 2>&1 
    fi
}

# Creates a directory and gets into it
xd() {
    if ! [[ -d '$1' ]]
    then
	mkdir $1
	cd $1
    else
	cd $1
    fi
}

function start() {
    if [[ -f 'yarn.lock' ]];
    then 
	    echo Starting YARN server 
	    yarn
	    sudo yarn start --ssl
    else 
	    echo Starting NPM server
	    sudo npm start
fi
}
" >>~/.zshrc

echo === Getting my keyboard configs ===

git clone https://gist.github.com/joaobb/72086d46fa85030d77cc79e113da58f2 /usr/share/X11/xkb/symbols/br

echo === Setting keyboard configs up ===

echo '# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="xbow_br"
XKBVARIANT="xbows-ptbr"
XKBOPTIONS=""

BACKSPACE="guess"' > /etc/default/keyboard/br
