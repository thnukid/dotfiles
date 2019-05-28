# Neovim configuration

To set up, install [vim-plug][vim-plug] and then install the plugins.

    $ curl -L -o ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    $ nvim +PlugInstall +qa

If the python3 provider is missing:
    $ python3 -m pip install --user --upgrade pynvim/
    $ nvim :UpdateRemotePlugin +qa

[vim-plug]: https://github.com/junegunn/vim-plug
