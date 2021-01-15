function backup --description 'Updates homebrew, upgrades homebrew packages and updates fish completetions'

    echo "> Backing up all the things..."


set -x NTWB_DOTFILES_REPO_PATH $HOME/Code/netweb/dotfiles

    set -x PATH $PATH "$COMPOSER_HOME/vendor/bin"


    cd ~/
    mkdir -p backup
    cd ~/backup

    echo "> Backing up homebrew"
    echo " > brew leaves > brew-list.txt # all top-level brew installs"
    brew leaves > brew-list.txt
    echo " > brew cask list > brew-leaves-list.txt"
    brew cask list > brew-cask-list.txt
    echo " > brew tap list > brew-tap-list.txt"
    brew tap  > brew-tap-list.txt

    echo "> Backing up Composer"
    echo " > cp ~/.composer.json composer.json"
    cp ~/.composer/composer.json composer.json

    echo "> Backing up npm"
    echo " > npm list -g --depth=0 > npm-g-list.txt"
    npm list -g --depth=0 > npm-g-list.txt

    echo "> Backing up Yarn"
    echo " > yarn global ls --depth=0 > yarn-g-list.txt"
    yarn global ls --depth=0 > yarn-g-list.txt

    echo "> Finished"
end
