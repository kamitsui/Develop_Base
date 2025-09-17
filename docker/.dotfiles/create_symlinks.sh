#!/bin/bash
TARGET="vim tmux"
stow -R -v -d ./packages -t ~ ${TARGET}
