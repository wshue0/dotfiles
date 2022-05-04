#!/usr/bin/zsh

export EDITOR="nvim"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export PATH=/home/michmich455/.local/bin:$PATH
export PATH=/usr/bin:$PATH

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD 
--color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 
--color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

# Koi
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color fg:#EBD3A4,bg:#170C04,hl:#F29E38,fg+:#ebdbb2,bg+:#3c3836,hl+:#F9762E
# --color info:#A9634A,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
export FZF_DEFAULT_COMMAND='fd --hidden --exclude "{.git,node_modules,.cache}" . '~''

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
