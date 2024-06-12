# Download Znap, if it's not there yet.
[[ -r ~/Repos/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Repos/znap
source ~/Repos/znap/znap.zsh  # Start Znap

##znap source marlonrichert/zsh-autocomplete

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bullet-train"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	npm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# change settings
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
BULLETTRAIN_DIR_FG=black
BULLETTRAIN_NVM_FG=black
BULLETTRAIN_GIT_PROMPT_CMD="\$(_omz_git_prompt_info)"

# use ripgrep instead of find
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{**/.git,**/.dist,**/node_modules}/*"'

# ---- Aliases ----
alias ohmyzsh="vim ~/.oh-my-zsh"
alias profile="nvim ~/.zshrc"
alias vprofile="vim ~/.config/nvim/init.lua"
alias clr="clear"
alias refresh="source ~/.zshrc"
alias lsa="ls -Al"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

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
alias grlb='git branch --merged | egrep -v "(^\*|master|main|dev|development)" | xargs git branch -d'
alias fixup='git log -n 50 --pretty=format:'%h %s' --no-merges | fzf | cut -c -7 | xargs -o git commit --fixup'

# Docker Shortcuts
alias dc='docker-compose'

# Cortex Shortcuts
alias cortex-dev='ssh ec2-user@ec2-35-161-198-160.us-west-2.compute.amazonaws.com -L 5433:cortex-db-development.cxzmxjvfphpn.us-west-2.rds.amazonaws.com:5432'

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

# ---- Setup for Paths & Tools ----

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add postgresql 16 to PATH
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Setup fzf shell integration
eval "$(fzf --zsh)"
