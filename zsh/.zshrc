export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export BAT_THEME="gruvbox-dark"

export ZSH_THEME="robbyrussell"
plugins=(git fzf doctl)

source $ZSH/oh-my-zsh.sh
alias vim=nvim
alias v=nvim
export PATH="$PATH:/Users/stephaneguillemot/.local/share/nvim/mason/bin/"
eval "$(starship init zsh)"

export RF_BASEPATH=/Users/stephaneguillemot/git 

for file in ~/.config/zsh/*.zsh; do
    source "$file"
done
