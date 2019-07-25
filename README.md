# dotfiles

> These are my dotfiles. There are many like them, but these ones are mine.

# Install Brew

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install All the software packages

    $ brew bundle

# Symlink dotfiles

    $ git clone git@github.com:thnukid/dotfiles.git ~/.dotfiles

    $ stow ctags git neovim personal-git ruby slate ssh zsh
