#!/bin/zsh
#
# .zshenv: Zsh environment file, loaded always.
#

# XDG BASE
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/etc}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/var/cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/var/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/var/state}
export XDG_BIN_HOME=${XDG_BIN_HOME:-$HOME/bin}
export XDG_DESK_HOME=${XDG_DESK_HOME:-$HOME/desk}
export XDG_LIB_HOME=${XDG_LIB_HOME:-$HOME/lib}
export XDG_OPT_HOME=${XDG_OPT_HOME:-$HOME/opt}

if [[ "$OSTYPE" != darwin* ]]; then
  export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/$(id -u)}
fi

# ZSH
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}
export ZDATADIR=${ZDATADIR:-$XDG_DATA_HOME/zsh}
export ZCACHEDIR=${ZCACHEDIR:-$XDG_CACHE_HOME/zsh}

# Ensure directories exist.
() {
  local zdir
  for zdir in $@; do
    [[ -d "${(P)zdir}" ]] || mkdir -p -- "${(P)zdir}"
  done
} XDG_{CONFIG,CACHE,DATA,STATE,BIN,DESK,LIB,OPT}_HOME Z{DOT,DATA,CACHE}DIR
