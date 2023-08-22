#!/usr/bin/env bash
#path for lvim stuff
export PATH=/home/michmich455/.local/bin:$PATH

#default editor
export EDITOR="lvim"
export VISUAL="lvim"

#fzf settings
source ~/.scripts/fzf_opts.sh
#use first argument to determine rip grep or opener
RIPGREP=$1
set title


if [[ $RIPGREP == 1 ]]; then
  export FZF_DEFAULT_COMMAND=$FZF_RG_COMMAND
  RG=$(fzf)
  TEMP=${RG%%:*}
  FZF=$(sed 's,\s*\\\s*, ,g' $TEMP)
  notify-send $FZF

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
else

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
fi



