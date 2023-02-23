#!/usr/bin/env bash

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# catppuccin colors
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD 
--color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 
--color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

export FZF_ALT_C_OPTS=$FZF_DEFAULT_OPTS'
--preview="exa --icons -1 -h {}"
'
export FZF_CTRL_T_OPTS=$FZF_DEFAULT_OPTS'
--preview="pistol {}"
'
# FZF_ALT_C_OPTS
export FZF_ALT_C_COMMAND='fd --hidden -t d --exclude "{.cmake,.android,.pyenv,.npm,.mozilla,.cache,go,.cargo,.config,.local,.vscode,.nvm,.jupyter,.git,node_modules}" . '~''
export FZF_OPENER_COMMAND='rg --files --hidden ~/.scripts/ ~/.dotfiles/ ~/Documents/ ~/Projects/ ~/Downloads/ ~/Pictures ; fd . -t d '~''
export FZF_CTRL_T_COMMAND='fd --hidden --exclude "{.git,node_modules}" . '/''
export FZF_RG_COMMAND='rg --hidden . ~/.scripts/ ~/.dotfiles/ ~/Documents/ ~/Projects/ ~/Downloads/ ~/Pictures'

export FZF_DEFAULT_COMMAND=$FZF_OPENER_COMMAND

