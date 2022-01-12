# oh my zsh and powerlevel10k stuff

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/tk/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"


plugins=(
    fast-syntax-highlighting 
    git
    zsh-autosuggestions
)


source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# paths and aliases

export PATH=$PATH:$HOME/.nimble/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.emacs.d/bin

export EDITOR=nvim
export VISUAL=nvim

alias m='cd /mnt/data'
alias c='cd /mnt/data/code'

alias chx='chmod +x'
alias py='python3'
alias :q='exit'
alias vi='neovide --multigrid'
alias e='nvim'

alias clipc='xclip -selection clipboard'
alias clipp='xclip -selection clipboard -o'

mcd () {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

nautilusicon () {
    gvfs-set-attribute "$1" metadata::custom-icon-name folder-"$2"-"$3"
}

