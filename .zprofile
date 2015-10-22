# Executes commands at login pre-zshrc.

################################################################################
# Browser
################################################################################

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

################################################################################
# Editors
################################################################################

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
  export PAGER='less'
else
  export EDITOR='vim'
  export VISUAL='vim'
  # TODO: emacs as client/daemon
  # export EDITOR='emacsclient -t'
  # export VISUAL='emacsclient -c -a emacs'
  export PAGER='less'
fi

################################################################################
# Language
################################################################################

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

################################################################################
# Paths
################################################################################

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/local/lib/luarocks/bin/
  $HOME/bin
  $path
)

# Add android
export ANDROID_HOME=/usr/local/opt/android-sdk

# lolcommits (derp)
# export LOLCOMMITS_ANIMATE=2
# export LOLCOMMITS_DELAY=1
# export LOLCOMMITS_DEVICE=

################################################################################
# Less
################################################################################

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

################################################################################
# Temporary Files
################################################################################

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi
