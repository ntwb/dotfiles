
# @ToDo Wrap the abbr's in a wrapper to check if they've previously been added, they only need adding once
# # See https://gitter.im/fish-shell/fish-shell?at=5921912705e3326c67f3d636
# if not set -q fish_initialized
#    abbr -a e emacs -nw
#    abbr -a c curl -LO -C -
#    set -U fish_initialized
# end
# Similarly, instead of running alias every time, you can funcsave the resulting functions.
# see also https://github.com/search?q=fish_user_abbreviations&type=Code&utf8=%E2%9C%93

# Cleanup abbr's
# function appbcleanup
#    for abbreviation in (abbr -l)
#        abbr -e $abbreviation
#    end
# end

if not set -q fish_initialized

    # cli
    abbr -a cp 'cp -i'
    abbr -a mv 'mv -i'
    abbr -a rm 'rm -iv'

    # directory navigation
    abbr -a -- - 'cd -'
    abbr -a .. 'cd ..'
    abbr -a ... 'cd ../..'
    abbr -a .... 'cd ../../..'
    abbr -a ..... 'cd ../../../..'
    abbr -a l 'ls'
    abbr -a la 'ls -a'
    abbr -a lla 'ls -al'

    # system
    abbr -a df "df -P -kHl"
    abbr -a time "time -p"

    # git
    if type -fq git
        abbr -a gbv 'git branch -vv'
        abbr -a gcd 'git checkout develop'
        abbr -a gcm 'git checkout master'
        abbr -a gcs 'git checkout staging'
        abbr -a gd 'git diff'
        abbr -a gdc 'git diff --cached'
        abbr -a grh 'git reset --hard HEAD'
        abbr -a grhs 'git reset --soft HEAD^'
        abbr -a grv 'git remote -v'
        abbr -a gs 'git status'
        abbr -a gsd 'git svn dcommit'
        abbr -a gsr 'git svn rebase'
        abbr -a gop 'npx git-open'
        # abbr -a gitrevert  'git checkout filname'
    end

    # svn
    if type -fq svn
        abbr -a sup 'svn up --ignore-externals'
        abbr -a sd 'svn diff'
        abbr -a si 'svn info'
        alias svnclean='svn revert -R *; find . -name "*.orig" -delete; find . -name "*.rej" -delete; svn up --ignore-externals'
    end

    # vagrant
    if type -fq vagrant
        abbr -a v 'vagrant'
        abbr -a vgs 'vagrant global-status'
        abbr -a vh 'vagrant halt'
        abbr -a vsq 'vagrant sequel'
        abbr -a vsh 'vagrant ssh'
        abbr -a vst 'vagrant status'
        abbr -a vup 'vagrant up'
    end

    # docker
    if type -fq docker
        abbr -a d 'docker'
        abbr -a dim 'docker images'
        abbr -a dp 'docker ps'
        abbr -a dpa 'docker ps -a'
        abbr -a dpq 'docker ps -q'
    end

    # docker compose
    if type -fq docker-compose
        abbr -a dc 'docker-compose'
    end

    set -U fish_initialized
end
