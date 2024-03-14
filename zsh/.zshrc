export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export BAT_THEME="gruvbox-dark"
plugins=(git fzf doctl)
source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
export RF_BASEPATH=$HOME/git 
for file in ~/.config/zsh/*.zsh; do
    source "$file"
done
export PATH=$HOME/go/bin:/opt/homebrew/bin:/opt/homebrew/opt/libxml2/bin/:$PATH

alias vim=nvim
alias v=nvim
