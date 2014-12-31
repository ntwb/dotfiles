# Bash Files
[[ -s ~/.bash_global ]] && source ~/.bash_global
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases
# .bashrc Mac OSX doesn't load this by default :/
# [[ -s ~/.bashrc ]] && source ~/.bashrc

# Git helpers
# via https://github.com/git/git/tree/master/contrib/completion
source ~/.git-prompt.sh
source ~/.git-completion.bash

# PS1 via Ryan McCue @rmccue
export PS1='\n\e[0;32m\u@\h \e[0;94m\w$(__git_ps1 "\[\e[00;31m\] [%s]")\e[m\n\$ '

# LS_COLORS via https://github.com/trapd00r/LS_COLORS
# Using GNU Core Utils "brew install coreutils", apps aliased with a `g` prefix
eval $(gdircolors -b $HOME/dircolors)
# eval $(gdircolors -b dircolors)

__git_complete g __git_maineval
