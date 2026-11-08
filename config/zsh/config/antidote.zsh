#
# antidote: The fastest Zsh plugin manager.
#

# Setup antidote.
export ANTIDOTE_ROOT=${ANTIDOTE_ROOT:=/usr/share/zsh-antidote}
export ANTIDOTE_HOME=${ANTIDOTE_STATE:=$XDG_STATE_HOME/zsh-antidote}

zstyle ':antidote:home' path $ANTIDOTE_HOME
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:plugin:*' defer-options '-p'


# Lazy-load antidote from its functions directory.
fpath=($ANTIDOTE_ROOT/functions $fpath)
autoload -Uz antidote

[[ -d $ANTIDOTE_STATE ]] || mkdir -p $ANTIDOTE_STATE

zplugins=${ZDOTDIR:-~}/.zsh_plugins
if [[ ! ${zplugins}.zsh -nt ${zplugins} ]] || [[ ! -e $ANTIDOTE_HOME/.lastupdated ]]; then
	antidote bundle <${zplugins}.txt >|${zplugins}.zsh
	date +%Y-%m-%dT%H:%M:%S%z >|$ANTIDOTE_HOME/.lastupdated
fi

function myplugininit {
  source ${zplugins}.zsh
}
