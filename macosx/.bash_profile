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
eval $(gdircolors -b $HOME/.dircolors)
# eval $(gdircolors -b dircolors)

__git_complete g __git_maineval

# via https://github.com/paulirish/dotfiles/blob/master/.bash_profile#L37
##
## gotta tune that bash_history…
##

# timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL=ignoredups:erasedups         # no duplicate entries
export HISTSIZE=100000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history
which shopt > /dev/null && shopt -s histappend  # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# ^ the only downside with this is [up] on the readline will go over all history not just this bash session.
