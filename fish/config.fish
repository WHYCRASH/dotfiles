# sources — system (cachyos provides done, aliases ls/la/ll, !! bindings)
source /usr/share/cachyos-fish-config/cachyos-config.fish
source /usr/share/aur-scan/integration.fish

# prompt & tools — single source of truth (was duplicated in ~/.fish_profile)
starship init fish | source
zoxide init --cmd cd fish | source
if status is-interactive
    atuin init fish | source
end

# user aliases — sourced after cachyos so they override system defaults
for f in $__fish_config_dir/aliases/*.fish
    source $f
end
