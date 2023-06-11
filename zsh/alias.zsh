alias code="open -a \"Visual Studio Code\""
alias trash="rmtrash"
alias szsh="source ~/.zshrc"


function v() {
  if [[ -z $1 ]]; then
    nvim .
  else
    nvim $@
  fi
}
