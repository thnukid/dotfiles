# Antigen
source $HOME/bin/antigen.zsh

# asdf programming version manager
source $HOME/.asdf/asdf.sh

### Prepend ~/bin to $PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

antigen use oh-my-zsh
antigen theme lukerandall

antigen bundles <<EOBUNDLES
  bundler
  rails
  zsh-completions
  command-not-found
  zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Fancy Ctrl-z
# instead of fg<enter> lets you use ctrl+z (like in vim)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# Map vim to nvim
alias vim="nvim"

# Update neovim bundles
alias nvbi="nvim +BundleInstall +qa"
alias nvbu="nvim +BundleUpdate +qa"

# Git aliases
alias g="git"
alias gst="git status -sb"
alias gco="git checkout"
alias gpom="git push origin master"
alias glog='git log --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ar%C(reset) %C(bold blue)%an%C(reset) %C(red)%d%C(reset) %s" --graph --abbrev-commit --decorate'
alias gd="git diff"
alias gap="git add -p"
alias gaa="git add ."
alias gc="git commit"
alias gb="git branch"
alias gba="git branch -a"
alias gbd="git branch -D"
alias gca="git commit --amend"
alias gmc='git ls-files --unmerged | cut -f2 | uniq' # git merge conflicts
alias glh="git lg | head -n 20"
alias grv="git remote -v"
alias gfo="git fetch origin"
alias gclr="git reset HEAD --hard ; git clean -fd"
alias gz="git archive -o snapshot.zip HEAD"
alias gt="git archive -o snapshot.tar.gz HEAD"
alias gpr="git --no-pager lg HEAD --not $1"
alias grp="git remote prune origin"
alias grhh="git reset HEAD --hard"

# Bundler
alias bi="bundle install"
alias be="bundle exec"
alias bu="bundle update"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Load keys into ssh-agent
ssh-add &>/dev/null
