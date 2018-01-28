# Executes commands at the start of an interactive session.

###############################################################################
# Config, Scripts
###############################################################################

# Added to support terminal in emacs, applies universally
# http://stackoverflow.com/questions/8918910/weird-character-zsh-in-emacs-terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# TODO: Bite the bullet and remove this, you're using other methods of styling your shell (iterm/hyper)
# Base16 Shell
#BASE16_SCHEME="eighties"
#BASE16_SHELL="$HOME/.src/base16-shell/base16-$BASE16_SCHEME.dark.sh"
# [[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

# Setup zsh-autosuggestions
  # source ~/.src/zsh-autosuggestions/autosuggestions.zsh

  # Enable autosuggestions automatically
  # zle-line-init() {
  #   zle autosuggest-start
  # }
  # zle -N zle-line-init

  # # `ctrl+t` to toggle autosuggestions
  # bindkey '^T' autosuggest-toggle
  # # Accept suggestions without leaving insert mode
  # bindkey '^<Enter>' vi-forward-word

  # zsh prediction
  # autoload predict-on
  # predict-on

# Up the default ulimit
ulimit -n 2048

# Bash style ..[TAB] completion
# http://stackoverflow.com/questions/564648/zsh-tab-completion-for-cd
zstyle -e ':completion:*' special-dirs '[[ $PREFIX = (../)#(|.|..) ]] && reply=(..)'

# TODO: ... another zsh completion?
fpath=(/usr/local/share/zsh-completions $fpath)

# tmuxinator completions
# TODO: broken, tmux completions was called with "no arguments"
# source ~/.bin/tmuxinator.zsh

# automated iterm2 injected script
source ~/.iterm2_shell_integration.zsh

# NVM Setup
export NVM_DIR="/usr/local/Cellar/nvm/0.29.0"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

###############################################################################
# Alias
###############################################################################

# Always list after cd
cd() { builtin cd "$@"; l; }

# not helpfull helpers
alias starwars="telnet towel.blinkenlights.nl"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# THE most common commands get a short alias
alias lc="colorsls -r"
# General
alias cl="clear"
alias g="git"
# Homebrew
alias b="brew"
alias bs="brew search"
alias bi="brew install"
alias bc="brew cask"
alias bcs="brew cask search"
alias bci="brew cask install"
# NPM
alias n="npm"
alias ni="npm install"
alias nis="npm install --save"
alias nisd="npm install --save-dev"
alias nr="npm run"
alias nrs="npm run start"
alias nrl="npm run lint"
alias nrlf="npm run lint:fix"
alias nrlw="npm run lint:watch"
alias nrlc="npm run lint:changed"
alias nrf="npm run flow"
alias nrt="npm run test"
# Yarn
alias y="yarn"
alias yi="yarn install"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yr="yarn run"
alias yrs="yarn run start"
alias yrl="yarn run lint"
alias yrlf="yarn run lint:fix"
alias yrlw="yarn run lint:watch"
alias yrlc="yarn run lint:changed"
alias yrt="yarn run test"
# Emacs
alias emacs="emacs -nw"
alias em="emacs"
alias ed="emacs --daemon"
alias ec="emacsclient -c"
alias e="ec"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias hidden-show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidden-hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Show/Hide all desktop icons (useful when presenting)
alias desktop-show="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias desktop-hide="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk-lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
# Put up screensaver (when going AFK)
alias afk-screen='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine &> /dev/null'
alias afk='afk-screen'

# see what apps are currently using the network
alias appsoninternet='sudo lsof -P -i -n | cut -f 1 -d " " | uniq'

# Flush DNS
alias flush-dns='sudo killall -HUP mDNSResponder'

# list what ports are currently open
alias listopenports='sudo lsof -i -P | grep -i "listen"'

# mount the drobster
alias mount-drobo="mount -t afp afp://rjhilgefort@192.168.200.44/Home ~/Drobo"
# alias mountdrobo="mount -t smbfs //rjhilgefort@192.168.200.44/Home ~/Drobo"

# list all git submodules in the current directory
alias git-submodule-list="grep path .gitmodules | sed 's/.*= //'"

# Mac dock mods - change the behavior of the dock
alias dock-reset='defaults delete com.apple.dock autohide-delay && killall Dock' # Back to normal
alias dock-meh='defaults write com.apple.dock autohide-delay -float 2 && killall Dock' # 2 seconds
alias dock-fuckoff='defaults write com.apple.dock autohide-delay -float 1000 && killall Dock' # 1000 seconds

# control volume
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# clvv/fasd
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'
alias jvim='fasd -f -e vim'
alias jem='fasd -f -e emacs'
alias jopen='fasd -f -e open'
alias jcat='fasd -f -e cat'
alias jless='fasd -f -e less'

# docker
alias d='docker'
alias d-containers-stop-all='docker stop $(docker ps -a -q)'
alias d-containers-remove-all='docker rm $(docker ps -a -q)'
alias d-images-remove-all='docker rmi $(docker images -q)'
alias d-volume-remove-all='docker volume rm $(docker volume ls -qf dangling=true)'
d-exec() { docker exec -it $1 bash; }

# docker-compose
alias dc='docker-compose'

# ssh shortcuts
alias ssh-nas='ssh -p 24 rjhilgefort@10.0.1.100'
alias ssh-gd='ssh robhilgefort@97.74.249.1'
alias ssh-mt='ssh robhilgefort.com@s160575.gridserver.com'
alias ssh-do-personal='ssh -p 4444 rjhilgefort@192.241.245.99'
alias ssh-pif='ssh robhilgefort@02d005f.netsolhost.com'

alias ssh-losant-canary='ssh rjhilgefort@canary.structure.land'
alias ssh-losant-staging-1='ssh rjhilgefort@staging-1.structure.land'
alias ssh-losant-staging-2='ssh rjhilgefort@staging-2.structure.land'
alias ssh-losant-release-1='ssh rjhilgefort@release-1.structure.land'
alias ssh-losant-release-2='ssh rjhilgefort@release-2.structure.land'
alias ssh-losant-prod-mongo='ssh rjhilgefort@prod-mongo-1a.structure.land'
alias ssh-losant-prod-1='ssh rjhilgefort@prod-docker-1.structure.land'
alias ssh-losant-prod-2='ssh rjhilgefort@prod-docker-2.structure.land'
alias ssh-losant-prod-3='ssh rjhilgefort@prod-docker-3.structure.land'
alias ssh-losant-prod-4='ssh rjhilgefort@prod-docker-4.structure.land'
alias ssh-losant-prod-5='ssh rjhilgefort@prod-docker-5.structure.land'

# ssh tunnel on localhost:{localPort} to {remote} for {remoteServiceExposedonPort}
# alias ssh-tunnel='ssh -f {user}@{remote} -L {localPort}:localhost:{remotePort} -i /Users/rjhilgefort/.ssh/id_rsa -N'
alias ssh-do-personal-tunnel='ssh -f -p 4444 rjhilgefort@192.241.245.99 -L 27019:localhost:27017 -i /Users/rjhilgefort/.ssh/id_rsa -N'
# TODO: Doesn't work, need to `mongo url`
alias ssh-losant-staging-tunnel='ssh -f rjhilgefort@staging-2.structure.land -L 27018:localhost:27017 -i /Users/rjhilgefort/.ssh/id_rsa -N'

# tig
alias t='tig status'

# ranger
alias r='ranger'

# git
alias git-merge-complete='git add -A && git commit --no-edit && git pp'
alias git-commit-cleanup='git add -A && git commit -m "Cleanup, tweaks, linter fixes" && git pp'

# fix tmux line
alias tmux-fix-status-line='vim ~/dotfiles/README.md -c "q"'

source /usr/local/share/zsh/site-functions/_aws

export PATH=/Users/rjhilgefort/.local/bin:$PATH
