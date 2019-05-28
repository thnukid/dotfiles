# Multiple identities for github and gitlab

[Guide](https://medium.com/the-andela-way/a-practical-guide-to-managing-multiple-github-accounts-8e7970c8fd46)

# Remove key identities

    $ cd ~
    $ ssh-add -D # removes all identities

# Add key identities

    $ ssh-add ~/.ssh/id_rsa
    $ ssh-add ~/.ssh/id_rsa_thnukid

# Check key identities

    $ ssh-add -l

# If correctly setup

    $ ssh -T github.com
    # Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.

    $ ssh -T github.com-thnukid
    # Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.

    $ ssh -T gitlab.com
    # Welcome to GitLab, USERNAME!

# How this works

`~/personal/.gitconfig` uses a different email address then the default `~/.gitconfig`. The `~/.gitconfig` has a conditional include when the gitdir is `~/personal`
