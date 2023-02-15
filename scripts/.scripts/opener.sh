#!/usr/bin/zsh

export EDITOR="nvim"
source ~/.scripts/fzf_opts.sh

set title
#FZF=$(fzf)
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
