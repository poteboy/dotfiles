export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH="./node_modules/.bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi
export PATH=~/.local/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PGDATA=/usr/local/var/postgres
export PATH="$HOME/.rbenv/bin:$PATH"
function precmd() {
  if [ ! -z $TMUX ]; then
    tmux refresh-client -S
  fi
}
# eval "$(rbenv init - zsh)"
# git設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
PROMPT='%n@%m %c'\$vcs_info_msg_0_' %# '
precmd(){ vcs_info }

function peco-cd {
  cd "$( ghq list --full-path | peco)"
}

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

pg() {
  git branch -a --sort=-authordate |
    grep -v -e '->' -e '*' |
    perl -pe 's/^\h+//g' |
    perl -pe 's#^remotes/origin/###' |
    perl -nle 'print if !$c{$_}++' |
    peco |
    xargs git checkout
}

alias pc='peco-cd'

setopt +o nomatch
alias cdd='cd desktop'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias cdm='cd; cd desktop/micin'
alias cdc='cd; cd desktop/schools/capstone'
alias dcb='docker-compose exec spring bash'
alias ide='~/.tmux/ide.sh'
alias dc='docker-compose'
alias ys='yarn start'
alias da='docker attach $(docker-compose ps -q server)'
alias t='tmux'
alias cdmc='cd; cd desktop/micin/curon-api-server'
alias cdml='cdm; cd latour'
alias tk='tmux kill-session'
alias ga='git add .'
alias gc='git commit -m'
alias gch='git checkout'
alias ts='cd; tmux source ~/.tmux.conf; cp -pr .tmux.conf ~/.tmux'
alias zs='cd; source ~/.zshrc; cp -pr ~/.zshrc ~/.tmux'
alias spec='docker-compose exec spring spring rspec'
alias py='python'
alias e='exit'
alias rubocop='docker-compose exec server rubocop --auto-correct'
alias ml='cd; cd desktop/MLproject'
alias gd="gatsby develop"
alias nd="npm run develop"
alias gph="git push origin HEAD"
alias snvm="source ~/.nvm/nvm.sh"
alias dev="cd; cd development"
alias pod="arch -x86_64 pod"
alias coo="cd; cd desktop; cd THECOO"
alias ei="nvm use 16 && expo start --ios"
alias remove="docker-compose down --rmi all --volumes --remove-orphans"
export PATH="/Users/poteboy/elrondsdk:$PATH"	# elrond-sdk
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $(brew --prefix nvm)/nvm.sh

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

# The next line updates PATH for the Google Cloud SDK.
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# if [ -f '/Users/keitafuruse/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/keitafuruse/Downloads/google-cloud-sdk/path.zsh.inc'; fi


# bun completions
[ -s "/Users/keitafuruse/.bun/_bun" ] && source "/Users/keitafuruse/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
