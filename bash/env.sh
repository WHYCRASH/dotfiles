# bash/env.sh — thin loader for every bash invocation (BASH_ENV + login + interactive)
# Sources universal ~/dotfiles/.env (absolute paths, no $HOME expansion needed)
export PATH="$HOME/.bun/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
[[ -f "$HOME/dotfiles/.env" ]] && source "$HOME/dotfiles/.env"
[[ -f "$HOME/.env" && "$HOME/.env" != "$HOME/dotfiles/.env" ]] && source "$HOME/.env"
