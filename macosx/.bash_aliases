# ls
# Using GNU Core Utils "brew install coreutils", apps aliased with a `g` prefix
alias ls='gls -alh --group-directories-first --color'

# cd via Aaron Jorbin @aaronjorbin
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias .....="cd ../../../../.."
alias ......="cd ../../../../../.."

# Git
alias g='git'
alias gs='git status'

# SVN
alias svn=colorsvn

# Vagrant via Ryan McCue @rmccue
alias v='vagrant'
alias vup='vagrant up'
alias vh='vagrant halt'
alias vsh='vagrant ssh'
