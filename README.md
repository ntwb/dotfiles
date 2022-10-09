# dotfiles

My personal dotfiles 

## Usage

1. Create (or restore) an SSH key and add it to your [GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

2. Install Homebrew:
  ```shell
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

3. Install Git:
  ```shell
  brew install git
  ```
	
4. Install [yadm](https://yadm.io)
  ```shell
  brew install yadm
  ```
 
5. Clone his repo with yadm:
  ```shell
  yadm clone git@github.com:ntwb/dotfiles.git
  ```
