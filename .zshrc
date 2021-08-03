# powerlevel10k and ohmyzsh stuff
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/thetek/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"



# plugins
plugins=(
    git
    fast-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# paths and aliases
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:/mnt/data/bin

alias c='cd /mnt/data/code'

alias a='atom'
alias a.='atom .'

alias chx='chmod +x'
alias py='python3'
alias ls='ls-extended'
alias :q='exit'

mcd () {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

eval $(thefuck --alias)

