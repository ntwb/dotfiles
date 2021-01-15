function update --description 'Updates fish completions homebrew, Composer, npm, Atom, Python, gems and anything else scriptable'

    echo "> Updating all the things..."
    echo "> Enter your password upfront:"
    #  sudo -v

    echo "> Updating and upgrading homebrew"
    echo " > brew update"
    brew update
    echo " > brew upgrade"
    brew upgrade
    echo " > brew cask upgrade"
    brew cask upgrade
    echo " > brew prune"
    #brew prune
    echo " > brew doctor"
    #brew doctor

    echo "> Updating fisher"
    fisher self-update
    fisher

    echo "> Updating fish completions"
    fish -c "fish_update_completions"

    echo "> Updating Composer"
    composer selfupdate
    composer global update

    echo "> Updating npm"
    npm install npm -g
    npm update -g

    # Shold remove Atom and switch to VSCode here
    echo "> Updating Atom packages"
    apm upgrade --no-confirm

    echo "> Updating Python 2"
    pip2 install --upgrade pip setuptools
    pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip2 install --upgrade

    echo "> Updating Python 3"
    pip3 install --upgrade pip setuptools
    pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install --upgrade

    echo "> Updating gems"
    sudo gem update --system
    sudo gem update --no-rdoc --no-ri
    #sudo gem update

    echo "> Finished"
end

# Clean all caches
function clean_all
    echo "> Cleaning homebrew"
    brew cask cleanup
    brew cleanup

    echo "> Cleaning npm"
    npm cache clean --force

    echo "> Cleaning gems"
    sudo gem clean

    echo "> Cleaning Composer"
    composer global clearcache

    echo "> Cleaning yarn"
    yarn cache clean
end

# The old bash/fish previous method

# https://github.com/paulirish/dotfiles/blob/master/.aliases#L73
# Update installed Ruby gems, Homebrew, npm, and their installed packages
# alias brew_update="brew -v update; brew -v upgrade; brew cleanup; brew cask cleanup; brew prune; brew doctor"
# alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-rdoc --no-ri'

# Sources for improving the above and inspiaration etc:
# https://github.com/MarkGriffiths/Shoal/blob/master/lib/functions/%C2%A7packages.fish
# https://github.com/yukimemi/dotfiles/blob/master/.config/fish/config.fish
# https://github.com/justinmayer/tackle/blob/master/plugins/up/up.fish
# https://github.com/elnappo/dotfiles/blob/master/config/fish/aliases.fish#L50
# https://github.com/publicarray/update/blob/master/functions/update.fish
