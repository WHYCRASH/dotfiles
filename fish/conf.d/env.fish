# ~/dotfiles/fish/conf.d/env.fish — loads universal ~/dotfiles/.env
# Fixes: (1) $HOME expansion via absolute paths + explicit replace, (2) spaces preserved as single string via quoted set -gx
if test -f ~/dotfiles/.env
    if type -q bass
        bass source ~/dotfiles/.env
    else
        for line in (grep -v '^#' ~/dotfiles/.env | grep -v '^$')
            set -l trimmed (string trim $line)
            string match -qr '^export\s+' $trimmed && set trimmed (string replace -r '^export\s+' '' $trimmed)
            set -l parts (string split -m 1 = $trimmed)
            test (count $parts) -eq 2 || continue
            set -l key (string trim $parts[1])
            set -l val (string trim $parts[2])
            # strip surrounding single/double quotes, keep inner spaces intact
            set val (string trim -c '"\'' -- $val)
            # explicit expansion for $HOME literals (fish does NOT expand command-substitution output)
            # .env uses absolute /home/dautist/... so this is fallback for any future $HOME entries
            set val (string replace -a '$HOME' $HOME -- $val)
            set val (string replace -a '${HOME}' $HOME -- $val)
            # generic $VAR expansion via bash if still contains $ (e.g. $USER)
            if string match -qr '\$' -- $val
                # use bash to expand remaining vars safely
                set val (bash -c "printf '%s' \"$val\"")
            end
            # re-quote: keep spaces as single string, not fish list
            set -gx $key "$val"
        end
    end
    fish_add_path -g ~/.bun/bin ~/.local/bin ~/.cargo/bin 2>/dev/null
end
