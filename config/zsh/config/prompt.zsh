#
# prompt: Setup Zsh prompt.
#

setopt prompt_subst       # Expand parameters in prompt variables.
setopt transient_rprompt  # Remove right prompt artifacts from prior commands.

function prompt_starship_setup {
  # When loaded through the prompt command, these prompt_* options will be enabled
  prompt_opts=(cr percent sp subst)

  if [[ -n "$1" ]]; then
    local -a configs=(
      $__zsh_config_dir/themes/$1.toml(N)
      ${XDG_CONFIG_HOME:-$HOME/.config}/starship/$1.toml(N)
    )
    (( $#configs )) && export STARSHIP_CONFIG=$configs[1]
  fi

  export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml

  # Initialize starship.
  if zstyle -t ':zsh:feature:prompt' 'use-cache'; then
    cached-eval 'starship-init-zsh' starship init zsh
  else
    source <(starship init zsh)
  fi
}

# Wrap promptinit.
function mypromptinit {
  # Initialize real built-in prompt system.
  unfunction mypromptinit
  autoload -Uz promptinit && promptinit

  # Hook starship into Zsh's prompt system.
  if (( $+commands[starship] )); then
    prompt_themes+=( starship )
  else
    unfunction prompt_starship_setup
  fi

  # Keep prompt array sorted.
  prompt_themes=( "${(@on)prompt_themes}" )

  # Set prompt
  if [[ $TERM == dumb ]]; then
    prompt 'off'
  else
    # Set prompt.
    local -a prompt_argv
    zstyle -a ':zsh:feature:prompt' 'theme' 'prompt_argv'
    if (( $#prompt_argv == 0 )); then
      if (( $+commands[starship] )); then
        prompt_argv=(starship zephyr)
      else
        prompt_argv=(off)
      fi
    fi
    prompt "$prompt_argv[@]"
  fi
}
