if (( ! $+commands[bat] )); then
  echo "bat not found. Please install bat from package manager"
  return 1
fi

alias cat='bat'

alias man='batman'
export MANPAGER=env\ BATMAN_IS_BEING_MANPAGER=yes\ zsh\ \$\(which\ batman\)
export MANROFFOPT=-c
compdef _man batman

alias codegrep='batgrep'

# alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
