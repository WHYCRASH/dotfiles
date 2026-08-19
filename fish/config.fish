# sources — system (cachyos provides done, aliases ls/la/ll, !! bindings)
source /usr/share/cachyos-fish-config/cachyos-config.fish
source /usr/share/aur-scan/integration.fish

# user aliases — sourced after cachyos so they override system defaults
for f in $__fish_config_dir/aliases/*.fish
    source $f
end

# prompt & tools — single source of truth (was duplicated in ~/.fish_profile)
starship init fish | source

set -gx _ZO_FZF_OPTS "--height 40% --layout=reverse --border --inline-info"
zoxide init --cmd cd fish | source

set -gx ATUIN_NOBIND "true"
if status is-interactive
    atuin init fish | source
end

bind \cr _atuin_search
bind \cf '__fzf_search_current_dir'
