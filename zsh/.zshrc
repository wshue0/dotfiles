# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# set terminal
export TERMINAL=/usr/bin/alacritty
export GOPATH=~/go

# Created by newuser for 5.8
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
set -o vi
# remove o key to prevent it from messing with Alt+O command in normal mode
bindkey -M vicmd -r o
bindkey -M vicmd -r O

#autosuggestions stuff
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export PATH=/home/michmich455/.local/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/home/michmich455/.scripts:$PATH

# fzf stuff
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#dpi settings
#export GDK_SCALE=2
#export GDK_DPI_SCALE=0.5

#koi colors
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
# --color fg:#EBD3A4,bg:#170C04,hl:#F29E38,fg+:#ebdbb2,bg+:#3c3836,hl+:#F9762E
# --color info:#A9634A,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
# catpuccin colors
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=bg+:#302D41,bg:#1E1E2E,spinner:#F8BD96,hl:#F28FAD 
--color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 
--color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD'

#export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#--color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
#--color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

export FZF_DEFAULT_COMMAND='fd --hidden --exclude "{.git,node_modules}" . '.''
export FZF_ALT_C_COMMAND='fd --hidden -t d --exclude "{.git,node_modules}" . '.''
export FZF_CTRL_O_COMMAND='fd --hidden -t f -t l  --exclude "{.git,node_modules}" . '.''
export FZF_CTRL_T_COMMAND='fd --hidden --exclude "{.git,node_modules}" . '/''

# old ls alias
# replace with exa
alias ls='exa --icons -1'
alias vim='nvim'
alias nv='nvim'
alias v='nvim'
# ranger alias
alias ra='ranger'
KEYTIMEOUT=10

#set config home
export XDG_CONFIG_HOME="${HOME}/.config/"

#set GTK theme not needed?
#export GTK_THEME=Gruvbox-Material-Dark-HIDPI

# Set vim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Set bat instead of cat
alias cat='bat'

# alias for opening in ranger

alias open='function _open(){ 
PASSED=$1

if [ ! -z "${PASSED}" ]

then

  if [ -d "${PASSED}" ]

  then 
    thunar $1 &>/dev/null & disown && exit

  else 
    rifle $1

  fi

fi

};_open'

alias o='open'

#backintime alias
alias backup='~/.scripts/backup.sh'

#chill alias
alias chill='~/.scripts/widgets.sh'

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/nvm/init-nvm.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$PATH:$HOME/.spicetify"
export PATH="$PATH:$HOME/go/bin"
