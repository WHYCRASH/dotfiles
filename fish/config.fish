# sources — system (cachyos provides done, aliases ls/la/ll, !! bindings)
source /usr/share/cachyos-fish-config/cachyos-config.fish
source /usr/share/aur-scan/integration.fish
atuin pty-proxy init fish | source





set -gx _ZO_FZF_OPTS "--height 40% --layout=reverse --border --inline-info"
zoxide init --cmd cd fish | source

if status is-interactive
    atuin init fish | source
    atuin ai init fish | source
    starship init fish | source
    fzf --fish | source
    fzf_configure_bindings --directory=\cf --variables=\cx --processes=\cp --history=
end




bind \cr _atuin_search
