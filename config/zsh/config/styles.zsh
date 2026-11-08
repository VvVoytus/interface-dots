#!/bin/zsh
#
# .zstyles - zstyle settings for features/plugins that need them.
#

#
# Antidote
#

# Keep all 3 for different test scenarios.
: ${ANTIDOTE_HOME:=${XDG_CACHE_HOME:-~/.cache}/repos}
antidote_repo=$ANTIDOTE_HOME/mattmc3/antidote
# antidote_repo=~/Projects/mattmc3/antidote
# antidote_repo=${HOMEBREW_PREFIX:-/opt/homebrew}/opt/antidote/share/antidote

#
# Custom
#

zstyle ':zsh:feature:prompt:starship' enabled yes
zstyle ':zsh:feature:prompt' theme 'starship' 'catppuccin-mocha'

zstyle ':zsh:feature:homebrew' enabled yes
zstyle ':zsh:feature:homebrew' use-cache yes

zstyle ':zsh:feature:color' enabled yes
zstyle ':zsh:feature:color' use-cache yes

zstyle ':zsh:feature:completion' enabled yes
zstyle ':zsh:feature:completion' use-cache yes

noexpand=(
  ls
  grep
  gpg
  vi
  z
)
