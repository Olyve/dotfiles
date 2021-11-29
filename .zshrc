source ~/.zsh-plugins/zsh-snap/znap.zsh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/sam/.oh-my-zsh"

ZSH_THEME="bullet-train"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-nvm
    zsh-256color
    zsh-better-npm-completion
    git
    tmux
)

source $ZSH/oh-my-zsh.sh

# ---- User configuration ----

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Change Settings
BULLETTRAIN_PROMPT_ORDER=(
	time
	status
	dir
	nvm
	git
)
BULLETTRAIN_DIR_EXTENDED=0
BULLETTRAIN_DIR_BG=magenta
BULLETTRAIN_DIR_FG=black
BULLETTRAIN_NVM_FG=black

# Use ripgrep instead of find
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{**/.git,**/dist,**/node_modules}/*"'

# Initialize Zoxide
eval "$(zoxide init zsh)"

# ---- Aliases ----
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias profile="nvim ~/.zshrc"
alias vprofile="nvim ~/.config/nvim/init.lua"
alias clr="clear"
alias refresh="znap restart"
alias linos="tmux a -t LinOS"
alias lsa="ls -Al"

# git alias commands
alias gf='git fetch'
alias gc='git checkout'
alias gb='git branch'
alias gs='git status'
alias gl="git log --all --graph --decorate --oneline --abbrev-commit --use-mailmap"
alias grb="git rebase"
alias grbi="git rebase -i"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias gadd="git add -u && gs"
alias gcm="git commit"
alias gcb='git checkout $(git branch -a | fzf-tmux -d 15 --no-preview | sed "s/remotes\/origin\///g")'
alias grlb='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'

# Docker Shortcuts
alias dc='docker-compose'

# Python Aliases #
alias python=python3

# ---- Custom functions ----

# Combined git commit & push and alias
git_commit_and_push() {
    git commit -m "$1"
    git push
}
alias gcp="git_commit_and_push"

# Find and kill process on specific port number
kill_process_on_port() {
    kill $(lsof -t -i :$1)
}
alias pkfire="kill_process_on_port"

# ---- Linos Stuff ----
export LINOS_DB_AUTOMATION_HOST=localhost
export LINOS_DB_AUTOMATION_USERNAME=local_user
export LINOS_DB_AUTOMATION_PASSWORD=local_password
export LINOS_DB_AUTOMATION_NAME=linos

alias luamake=/home/sam/clones/lua-language-server/3rd/luamake/luamake
if [ -e /home/sam/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sam/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# Add custom scripts
PATH=$PATH:/home/sam/scripts

# Add WABT to path
PATH=$PATH:/home/sam/clones/wabt-1.0.24/bin/
