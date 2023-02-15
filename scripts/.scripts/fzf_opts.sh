#!/usr/bin/env bash
export EDITOR="nvim"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#koi colors
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color fg:#EBD3A4,bg:#170C04,hl:#F29E38,fg+:#ebdbb2,bg+:#3c3836,hl+:#F9762E
# --color info:#A9634A,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

# catpuccin colors
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD 
--color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 
--color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

#? idk what color this is 
#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
#--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

#export FZF_DEFAULT_COMMAND='fd . '~'; fd --hidden -t f --exclude "{.vscode,.nvm,.jupyter,.git,node_modules,.cache,.vim}" . '~'; fd --hidden -t d --exclude "{.vscode,.nvm,.jupyter,.git,node_modules,.cache,.vim}" . '~''
export FZF_DEFAULT_COMMAND='fd --hidden -t f --exclude "{.vscode,.nvm,.jupyter,.git,node_modules,.cache,.vim}" . '~'; fd --hidden -t d --exclude "{.vscode,.nvm,.jupyter,.git,node_modules,.cache,.vim}" . '~''
export FZF_ALT_C_COMMAND='fd . '~'; fd --hidden -t d --exclude "{.vscode,.nvm,.jupyter,.git,node_modules}" . '.''
export FZF_CTRL_O_COMMAND='fd . '~'; fd --hidden -t f -t l  --exclude "{.git,node_modules}" . '.''
export FZF_CTRL_T_COMMAND='fd --hidden --exclude "{.git,node_modules}" . '/''

