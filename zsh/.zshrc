# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Seting env vars and aliases
export EDITOR="lvim"
export VISUAL="lvim"
export LIBVA_DRIVER_NAME="nvidia"
alias vim='lvim'
alias vi='lvim'
alias ls='exa --icons -1'
alias ra='ranger'
# Set bat instead of cat
alias cat='bat'

# script aliases
alias backup='~/.scripts/backup.sh'
alias wallpaperize='~/.scripts/wallpaper.sh'
alias dotsync='~/.dotfiles/sync.sh'

# set terminal
export TERMINAL=/usr/bin/alacritty

# other path/home variables
#appending to path
export GOPATH=~/go
#set config home
export XDG_CONFIG_HOME="${HOME}/.config/"

export PATH=/home/michmich455/.local/bin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/home/michmich455/.scripts:$PATH
export PATH="$PATH:$HOME/.spicetify"
export PATH="$PATH:$HOME/go/bin"

# pyenv
eval "$(pyenv init -)"  
eval "$(pyenv virtualenv-init -)"

# fzf stuff
source ~/.scripts/fzf_opts.sh

# Created by newuser for 5.8
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
set -o vi

# zshvim bindings
# remove o key to prevent it from messing with Alt+O command in normal mode
bindkey -M vicmd -r o
bindkey -M vicmd -r O
# ?
KEYTIMEOUT=10

#autosuggestions stuff
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt SHARE_HISTORY

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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/share/nvm/init-nvm.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
