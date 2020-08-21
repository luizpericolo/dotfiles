#!/usr/bin/env bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
NORMAL=$(tput sgr0)

HERE=$PWD

CONFIG_PATH="$HOME/.config"

#    deploy starship
function deploy_starship () {
    printf "${CYAN}### DEPLOYING STARSHIP DOTFILE ###\n${NORMAL}"
    STARSHIP_CONFIG_FILE="$CONFIG_PATH/starship.toml"
    STARSHIP_VERSIONED_FILE="$HERE/starship/starship.toml"
    if [ -f $STARSHIP_CONFIG_FILE  ] || [ -L $STARSHIP_CONFIG_FILE ]; then
        echo "file $STARSHIP_CONFIG_FILE already exists. doing nothing..."
    else
        ln -s $STARSHIP_VERSIONED_FILE $STARSHIP_CONFIG_FILE
        PROOF=`ls -l $STARSHIP_CONFIG_FILE | cut -d' ' -f9,10,11,12`
        echo "${POWDER_BLUE}$PROOF ${GREEN}symlink created!${NORMAL}"
    fi
    printf "${CYAN}### STARSHIP DOTFILE DEPLOYED ###\n\n${NORMAL}"
}


# # deploy tmux
function deploy_tmux () {
    printf "${CYAN}### DEPLOYING TMUX DOTFILE ###\n${NORMAL}"
    TMUX_CONFIG_FILE="$HOME/.tmux.conf"
    TMUX_CONFIG_VERSIONED_FILE="$HERE/tmux/.tmux.conf"
    if [ -f $TMUX_CONFIG_FILE ] || [ -L $TMUX_CONFIG_FILE ]; then
        echo "file $TMUX_CONFIG_FILE already exists. doing nothing..."
    else
        ln -s $TMUX_CONFIG_VERSIONED_FILE $TMUX_CONFIG_FILE
        PROOF=`ls -l $TMUX_CONFIG_FILE | cut -d' ' -f9,10,11,12`
        echo "${POWDER_BLUE}$PROOF symlink created!${NORMAL}"
    fi

    TMUX_CONFIG_LOCAL_FILE="$HOME/.tmux.conf.local"
    TMUX_CONFIG_LOCAL_VERSIONED_FILE="$HERE/tmux/.tmux.conf.local"
    if [ -f $TMUX_CONFIG_LOCAL_FILE ] || [ -L $TMUX_CONFIG_LOCAL_FILE ]; then
        echo "file $TMUX_CONFIG_LOCAL_FILE already exists. doing nothing..."
    else
        ln -s $TMUX_CONFIG_LOCAL_VERSIONED_FILE $TMUX_CONFIG_LOCAL_FILE
        PROOF=`ls -l $TMUX_CONFIG_LOCAL_FILE | cut -d' ' -f9,10,11,12`
        echo "${POWDER_BLUE}$PROOF symlink created!${NORMAL}"
    fi
    printf "${CYAN}### TMUX DOTFILE DEPLOYED ###\n\n${NORMAL}"
}

# deploy alacritty
function deploy_alacritty () {
    printf "${CYAN}### DEPLOYING ALACRITTY DOTFILE ###\n${NORMAL}"
    ALACRITTY_CONFIG_FOLDER="$CONFIG_PATH/alacritty"
    if [ -d $ALACRITTY_CONFIG_FOLDER ]; then
        echo "folder $ALACRITTY_CONFIG_FOLDER already exists. doing nothing..."
    else
        mkdir -p $ALACRITTY_CONFIG_FOLDER
        echo "${GREEN}folder ${POWDER_BLUE}$ALACRITTY_CONFIG_FOLDER ${GREEN}created!${NORMAL}"
    fi

    ALACRITTY_CONFIG_FILE="$ALACRITTY_CONFIG_FOLDER/alacritty.yml"
    ALACRITTY_VERSIONED_FILE="$HERE/alacritty/alacritty.yml"

    if [ -f $ALACRITTY_CONFIG_FILE ] || [ -L $ALACRITTY_CONFIG_FILE ]; then
        echo "file $ALACRITTY_CONFIG_FILE already exists. doing nothing..."
    else
        ln -s $ALACRITTY_VERSIONED_FILE $ALACRITTY_CONFIG_FILE
        PROOF=`ls -l $ALACRITTY_CONFIG_FILE | cut -d' ' -f9,10,11,12`
        echo "${POWDER_BLUE}$PROOF ${GREEN}symlink created!${NORMAL}"
    fi
    printf "${CYAN}### ALACRITTY DOTFILE DEPLOYED ###\n\n${NORMAL}"
}

# # deploy zshrc
function deploy_zshrc () {
    printf "${CYAN}### DEPLOYING ZSH DOTFILE ###\n${NORMAL}"
    ZSH_CONFIG_FILE="$HOME/.zshrc"
    ZSH_CONFIG_VERSIONED_FILE="$HERE/zsh/.zshrc"
    if [ -f $ZSH_CONFIG_FILE ] || [ -L [ -f $ZSH_CONFIG_FILE ]; then
        echo "file $ZSH_CONFIG_FILE already exists. doing nothing..."
    else
        ln -s $ZSH_CONFIG_VERSIONED_FILE $ZSH_CONFIG_FILE
        PROOF=`ls -l $ZSH_CONFIG_FILE | cut -d' ' -f9,10,11,12`
        echo "${POWDER_BLUE}$PROOF ${GREEN}symlink created!${NORMAL}"
    fi

    printf "${CYAN}### ZSH DOTFILE DEPLOYED ###\n\n${NORMAL}"
}


function deploy_all () {
    if [ -d $CONFIG_PATH ]; then
        echo "folder $CONFIG_PATH already exists" 
    else
        mkdir -p $CONFIG_PATH
        echo ${GREEN}"folder ${POWDER_BLUE}$CONFIG_PATH ${GREEN}created!${NORMAL}"
    fi
    printf "\n"
    deploy_starship
    deploy_tmux
    deploy_alacritty
    deploy_zshrc

}

deploy_all