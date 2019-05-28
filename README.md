# dotfiles
These are my dotfiles. There are many like it, but these ones are mine.

# Install and Symlink dotfiles

```
brew install stow
```

Move `.dotfiles` directory to your home directory `~/`.
GNU Stow assumes that the contents of the <dir> you specify should live one directory above where the stow command is run.
When this repository lives in `~/.dotfiles`, `stow` will work out of the box(tm).


```
$ stow slate # Same as: ln -s .dotfiles/slate/.slate ~/.slate
```

