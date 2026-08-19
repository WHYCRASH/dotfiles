function agentzero --wraps="env TERM=xterm-256color ssh -t dautist@209.38.2.233 'cd /home/dautist; exec \$SHELL -l'" --wraps="env TERM=xterm-256color ssh -t dautist@209.38.2.233 'cd /home/dautist/agentzero; exec \$SHELL -l'" --description "alias agentzero=env TERM=xterm-256color ssh -t dautist@209.38.2.233 'cd /home/dautist/agentzero; exec \$SHELL -l'"
    env TERM=xterm-256color ssh -t dautist@209.38.2.233 'cd /home/dautist/agentzero; exec $SHELL -l' $argv
end
