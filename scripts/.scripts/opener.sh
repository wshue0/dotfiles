#!/usr/bin/env bash
#path for lvim stuff
export PATH=/home/michmich455/.local/bin:$PATH

#default editor
export EDITOR="lvim"
export VISUAL="lvim"

#fzf settings
source ~/.scripts/fzf_opts.sh

set title
FZF=$(~/.scripts/preview_ueber.sh)
if [ ! -z "${FZF}" ]

then

  if [ -d "${FZF}" ]

  then 
    i3-msg '[instance = "opener" title = "Alacritty"] kill'
    nohup thunar $FZF &>/dev/null

  else 
    cd $(dirname $FZF)
    rifle $FZF
  fi

fi
