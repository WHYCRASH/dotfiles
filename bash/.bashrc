#
# ~/.bashrc
#

[[ -f "$HOME/dotfiles/bash/env.sh" ]] && source "$HOME/dotfiles/bash/env.sh"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


# Added by Antigravity CLI installer
export PATH="/home/dautist/.local/bin:$PATH"

# Tools — mirror fish config.fish:11,14,18 (starship, zoxide, atuin)
if [[ $- == *i* ]]; then
  eval "$(starship init bash)" 2>/dev/null || true
  eval "$(zoxide init bash)" 2>/dev/null || true
  export ATUIN_NOBIND="true"
  eval "$(atuin init bash 2>/dev/null)" || true
  # Eza aliases — replicate fish aliases/eza.fish, override ls
  if command -v eza >/dev/null 2>&1; then
    unalias ls la ll lla 2>/dev/null; true
    alias ls="eza -G --color=always --group-directories-first --icons=always"
    alias la="eza -Ga --color=always --group-directories-first --icons=always"
    alias ll="eza -ll --color=always --group-directories-first --icons=always"
    alias lla="eza -la --color=always --group-directories-first --icons=always"
  fi
  alias nano="command micro"
  eval "$(omp completions bash 2>/dev/null)" || true
fi
