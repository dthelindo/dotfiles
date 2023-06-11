export ZSH="/Users/daniel/.oh-my-zsh"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker)
source $ZSH/oh-my-zsh.sh

# init starship
eval "$(starship init zsh)"

# init zoxide
eval "$(zoxide init zsh)"
