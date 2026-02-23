# fish shell configuration
# Updated: 2024-12-15 Update via @netweb-macbook recent changes
if status is-interactive
#   # Commands to run in interactive sessions can go here
    # source /opt/homebrew/opt/asdf/libexec/asdf.fish
    fzf --fish | source
    set -Ux EDITOR 'code -n -w'
    set -Ux SVN_EDITOR 'code -n -w'
    set -Ux RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/config
    set -Ux DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
    set -Ux LESSKEY "$XDG_CONFIG_HOME/less/lesskey"
    set -Ux LESSHISTFILE "$XDG_STATE_HOME/less/history"
    set -Ux MYSQL_HISTFILE "$XDG_DATA_HOME/mysql_history"
    set -Ux VAGRANT_HOME "$XDG_DATA_HOME/vagrant"
    set -Ux HOMEBREW_NO_INSTALL_CLEANUP 1l
    set -Ux HOMEBREW_AUTO_UPDATE_SECS 86400
#     zoxide init fish | source
#     thefuck --alias | source
#     set -Ux RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/config
end


echo "These are not the droids you are looking for..."
# 2024-12-15 Adding XDG environment variables
# Ensure the directory exists
set user_id (id -u)
set user_group (id -g)
if not test -d "/var/run/user/$user_id"
    sudo mkdir -p "/var/run/user/$user_id"
    sudo chown $user_id:$user_group "/var/run/user/$user_id"
end

# XDG
# export XDG_DATA_HOME="$HOME"/.local/share
set -Ux XDG_DATA_HOME "$HOME/.local/share"

# export XDG_CONFIG_HOME="$HOME"/.config
set -Ux XDG_CONFIG_HOME "$HOME/.config"

# export XDG_STATE_HOME="$HOME"/.local/state
set -Ux XDG_STATE_HOME "$HOME/.local/state"

# export XDG_CACHE_HOME="$HOME"/.cache
set -Ux XDG_CACHE_HOME "$HOME/.cache"

# export XDG_RUN_HOME=/var/run/user/$user_id
set -Ux XDG_RUN_HOME "/var/run/user/$user_id"

# export XDG_RUNTIME_DIR=/var/run/user/$user_id
set -Ux XDG_RUNTIME_DIR "/var/run/user/$user_id"

# Additional XDG directories
set -Ux XDG_DOWNLOAD_DIR "$HOME/Downloads"
set -Ux XDG_DOCUMENTS_DIR "$HOME/Documents"
set -Ux XDG_DESKTOP_DIR "$HOME/Desktop"
set -Ux XDG_MUSIC_DIR "$HOME/Music"
set -Ux XDG_PICTURES_DIR "$HOME/Pictures"
set -Ux XDG_VIDEOS_DIR "$HOME/Videos"


# New fish dotfiles https://github.com/ntwb/dotfiles/blob/master/fish/config.fish

# @ToDo Set the default home for my dotfiles, needs to be symlink friendly
# set -x FISH_CONFIG $HOME/git/dotfiles/config.fish
# set -x FISH_DIR $HOME/.config/fish

# set -x NTWB_DOTFILES_REPO_PATH $HOME/Code/netweb/dotfiles

# Dotfiles config
# This may have had vscode exploding as this Git path I doubt is active
# alias dotfiles='/usr/bin/git --git-dir=/Users/dotfiles/.dotfiles/ --work-tree=/Users/dotfiles'

# Editor
# if test (which code)
#     set -Ux EDITOR 'code -n -w'
#     set -Ux SVN_EDITOR 'code -n -w'
# else
#     set -Ux EDITOR nano
#     set -Ux SVN_EDITOR nano
# end

# Composer
# if type -fq composer
#     set -x COMPOSER_HOME "$HOME/.composer"
#     set -x COMPOSER_BIN_PATH "$HOME/.composer/bin"
#     set -x PATH $PATH "$COMPOSER_HOME/vendor/bin"
#
#     alias cu "composer update"
#     alias cda "composer dump-autoload"
#     alias ci "composer install"
#     alias csu "sudo composer self-update"
#     alias cda "composer dump-autoload"
#     alias cda "composer dump-autoload"
# end
# Composer
# if type -fq java
#     set -x PATH $PATH "$HOME/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home"
# end
# PHPCS
if type -fq phpcs
    alias phpcsdoc "phpcs --standard=WordPress-Docs -p -s -v --colors --extensions=php"
    alias phpcsvar "phpcs --standard=VariableAnalysis -p -s -v --colors --extensions=php"
    alias phpcsxml "phpcs --standard=phpcs.xml.dist -p -s -v --colors --extensions=php"
end

# operating system specific environment variables

# System check functions
function isMac
    test (uname -s) = "Darwin"
end
function isLinux
    test (uname -s) = "Linux"
end
function isLinuxArm
    test (uname -sm) = "Linux armv7l"
end
function isWindows
    test (uname -s) = "MINGW32_NT-6.2"
end

if isMac
    #    set -Ux BBP_TESTS_DIR $HOME/dev/bbpress.svn.wordpress.org/trunk/tests/phpunit
    #    set -Ux BP_TESTS_DIR $HOME/dev/buddypress.svn.wordpress.org/trunk/tests/phpunit
    #    set -Ux WP_DEVELOP_DIR $HOME/dev/develop.svn.wordpress.org/trunk
    #    set -Ux WP_ROOT_DIR $HOME/dev/develop.svn.wordpress.org/
    #    set -Ux WP_TESTS_DIR $HOME/dev/develop.svn.wordpress.org/trunk/tests/phpunit
    #    set -Ux GITHUB_TOKEN (cat ~/.github_token)
    #    set -Ux HOMEBREW_GITHUB_API_TOKEN (cat ~/.github_token)

else if isLinux
    # install apt-add-repository

else if isWindows

end


# if test -s $FISH_DIR/config.local.fish
#     source $FISH_DIR/config.local.fish
# end

# Via https://github.com/hotoolong/dotfiles/blob/3ae4b7118f12f18210ca56824ea92005cea9ead8/configs/fish/config.fish#L80
# Yeah disable this too
# function is_git_dir
#     git rev-parse --is-inside-work-tree > /dev/null 2>&1
# end

# Old not-fish dotfiles below https://github.com/ntwb/dotfiles/tree/master/macosx

# npm npx alias for pjv
abbr -a pjv 'npx package-json-validator -w -r --spec npm package.json'

# npm npx alias for pullit
abbr -a pullit 'npx pullit'

# npx npx alias for fkill https://github.com/sindresorhus/fkill-cli
abbr -a fkill 'npx fkill-cli'

# Home Brew
# MacBook (Old HomeBrew install)
# set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
# Mac Mini (New HomeBrew Install)
set -Ux fish_user_paths "/opt/homebrew/bin" $fish_user_paths
set -Ux fish_user_paths "/opt/homebrew/sbin" $fish_user_paths
set -Ux fish_user_paths "/opt/homebrew/opt/python@3.10/libexec/bin" $fish_user_paths


# Node.js

# nvm current https://github.com/jorgebucaran/nvm.fish
# nvm alternative https://github.com/Schniz/fnm
# nvm alternative https://github.com/brigand/fast-nvm-fish
# Ensure the Users/netweb/.local/share/nvm/ folder has been created

# nvm install 10
# nvm install 12
# nvm install 14
# which node
# which npm
# node --version
# npm --version
# npm list -g --depth=0

# ❯ nvm use 14
# Now using Node v14.17.3 (npm 6.14.13) ~/.local/share/nvm/v14.17.3/bin/node
# ~                                                                                                                                                                                                                  ⬢ v14.17.3
# ❯ npm list -g --depth=0
# /Users/netweb/.local/share/nvm/v14.17.3/lib
# └── npm@6.14.13
#
# ~                                                                                                                                                                                                                  ⬢ v14.17.3
# ❯ nvm use 12
# Now using Node v12.22.3 (npm 6.14.13) ~/.local/share/nvm/v12.22.3/bin/node
# ~                                                                                                                                                                                                                  ⬢ v12.22.3
# ❯ npm list -g --depth=0
# /Users/netweb/.local/share/nvm/v12.22.3/lib
# └── npm@6.14.13
#
# ~                                                                                                                                                                                                                  ⬢ v12.22.3
# ❯ nvm use 10
# Now using Node v10.24.1 (npm 6.14.12) ~/.local/share/nvm/v10.24.1/bin/node
# ~                                                                                                                                                                                                                  ⬢ v10.24.1
# ❯ npm list -g --depth=0
# /Users/netweb/.local/share/nvm/v10.24.1/lib
# └── npm@6.14.12

# Node 14 - Deprecated, use jorgebucaran/nvm.fish instead
# MacBook (Old HomeBrew install)
# set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths
# set -g fish_user_paths "/opt/homebrew/opt/node@14/bin" $fish_user_paths
# Mac Mini (New HomeBrew Install)
# set -g fish_user_paths "/opt/homebrew/opt/node@14/bin" $fish_user_paths

# Node 12 - Deprecated, use jorgebucaran/nvm.fish instead
# MacBook (Old HomeBrew install)
# set -g fish_user_paths "/usr/local/opt/node@12/bin" $fish_user_paths
# Mac Mini (New HomeBrew Install)
#set -g fish_user_paths "/opt/homebrew/opt/node@12/bin" $fish_user_paths

# Node 10 - Deprecated, use jorgebucaran/nvm.fish instead
# MacBook (Old HomeBrew install)
# set -g fish_user_paths "/usr/local/opt/node@10/bin" $fish_user_paths

# Node 8 - Deprecated, use jorgebucaran/nvm.fish instead
# MacBook (Old HomeBrew install)
# set -g fish_user_paths "/usr/local/opt/node@8/bin" $fish_user_paths

# END NODE SECTION

# PHP 7.2
# MacBook (Old HomeBrew install)
# set -g fish_user_paths "/usr/local/opt/php@7.2/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/php@7.2/sbin" $fish_user_paths

# PHP 7.3
# MacBook (Old HomeBrew install)
# set -g fish_user_paths "/usr/local/opt/php@7.3/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/php@7.3/sbin" $fish_user_paths

# PHP 7.4
# MacBook (Old HomeBrew install)
# set -g fish_user_paths "/usr/local/opt/php@7.4/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/php@7.4/sbin" $fish_user_paths
# Mac Mini (New HomeBrew Install)
# set -g fish_user_paths "/opt/homebrew/opt/php@7.4/bin" $fish_user_paths
# set -g fish_user_paths "/opt/homebrew/opt/php@7.4/sbin" $fish_user_paths

# PHP 8.0
# MacBook (Old HomeBrew install)
# set -g fish_user_paths "/usr/local/opt/php@8.0/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/php@8.0/sbin" $fish_user_paths
# Mac Mini (New HomeBrew Install)
# set -g fish_user_paths "/opt/homebrew/opt/php@8.0/bin" $fish_user_paths
# set -g fish_user_paths "/opt/homebrew/opt/php@8.0/sbin" $fish_user_paths

set -g fish_emoji_width 2

#ripgrap
set -Ux RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/config

# https://github.com/ajeetdsouza/zoxide
# zoxide init fish | source

source /Users/netweb/.docker/init-fish.sh || true # Added by Docker Desktop

# fish_add_path /opt/homebrew/opt/ruby@2.6/bin
fish_add_path /opt/homebrew/opt/ruby@2.7/bin

# nvm install lts/hydrogen
# Installing Node v18.18.2 lts/hydrogen
# Fetching https://nodejs.org/dist/v18.18.2/node-v18.18.2-darwin-arm64.tar.gz
# Now using Node v18.18.2 (npm 9.8.1) ~/.local/share/nvm/v18.18.2/bin/node
# node --version
# v18.18.2
# npm --version
# 9.8.1

# set --universal nvm_default_version lts/hydrogen

# Im a new shell straignt after the install these result /shrug
# Welcome to fish, the friendly interactive shell
# Type `help` for instructions on how to use fish
# netweb@netweb-macmini ~/C/h/standard-chartered (25104-altis-v12-upgrade)> npm --version
# 7.18.1
# netweb@netweb-macmini ~/C/h/standard-chartered (25104-altis-v12-upgrade)> node --version
# v18.18.2
# netweb@netweb-macmini ~/C/h/standard-chartered (25104-altis-v12-upgrade)>

# vagrant
set -Ux VAGRANT_HOME "$XDG_DATA_HOME/vagrant"

# zsh
set -Ux HISTFILE "$XDG_STATE_HOME/zsh/history"

# zsh
# set -gx HISTFILE "$XDG_STATE_HOME/zsh/history"

# svn
#  Alias svn to use a custom configuration location:
# alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"

# wget
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# 2025-11-03 abbr via https://github.com/fish-shell/fish-shell/releases/tag/4.0.0
abbr --add --command git back 'reset --hard HEAD^'

# nix shell nixpkgs#{git,ripgrep,fd,bat,jq,fzf} --command fish

# set -Ux PROJECT_ENDPOINT="https://foundry-flick-resource.services.ai.azure.com/api/projects/foundry-flick"
# set -Ux AGENT_NAME="MyAgent"
# set -Ux MODEL_DEPLOYMENT_NAME="gpt-4.1-mini"
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish
