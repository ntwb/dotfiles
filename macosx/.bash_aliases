# ls
# Using GNU Core Utils "brew install coreutils", apps aliased with a `g` prefix
alias ls='gls -alh --group-directories-first --color'

# cd via Aaron Jorbin @aaronjorbin
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias .....="cd ../../../../.."
alias ......="cd ../../../../../.."

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

# via https://github.com/paulirish/dotfiles/blob/master/.aliases#L39
# `cat` with beautiful colors. requires: sudo easy_install -U Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# https://github.com/paulirish/dotfiles/blob/master/.aliases#L73
# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew -v upgrade --all; brew cleanup; brew cask cleanup; brew prune; brew doctor"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-rdoc --no-ri'

# Git
alias g='git'
alias gs='git status'

# via https://github.com/paulirish/dotfiles/blob/master/.aliases#L52
# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias dig="dig +nocmd any +multiline +noall +answer"

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

alias diskspace_report="df -P -kHl"
alias free_diskspace_report="diskspace_report"

# See https://github.com/Wilto/dotfiles/blob/master/bash/bash_aliases#L18-L22
# Reset previous commit, but keep all the associated changes.
alias goddammit="git reset --soft HEAD^"

# Welp.
alias heckit="git reset --hard HEAD"

# SVN
alias svn=colorsvn

# Vagrant via Ryan McCue @rmccue
alias v='vagrant'
alias vup='vagrant up'
alias vh='vagrant halt'
alias vsh='vagrant ssh'
