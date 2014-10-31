#!/bin/sh

APP_DIR=$HOME/.kiennt_dotfile

if [ ! -d "$APP_DIR" ]; then
    echo "Installing YADR for the first time"
    git clone https://github.com/skwp/dotfiles.git "$APP_DIR"
    cd "$APP_DIR"
    for f in .*; do
        if [[ $f != ".git"  && $f != "." && $f != ".." && $f != ".gitmodules" ]]; then
            cp -r $f $HOME
        fi
    done

else
    echo "YADR is already installed"
fi
