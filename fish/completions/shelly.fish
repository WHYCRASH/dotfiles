Description:
  Repair Shelly directory ownership, manage pacfiles, or generate CLI documentation and shell completions.

Usage:
  shelly utility [type] [options]

Options:
  -?, -h, --help    Show command-specific help and usage information
  -n, --no-confirm  Use safe automatic answers instead of prompting
  -U, --ui-mode     Emit framed output for the Shelly UI
  -j, --json        Output structured JSON where the command supports it

Modifiers by Type:
  utility only:
    -f, --fix-permissions            Restore the invoking user's ownership of Shelly's configuration, cache, and data directories
    -r, --repair-db                  Remove a stale database lock
    -d, --docs                       Write Markdown CLI reference documentation to standard output
    -c, --completions <completions>  Write a Bash, Fish, or Zsh completion script to standard output
    -p, --pacfiles                   Run the pacdiff-compatible pacnew, pacorig, and pacsave maintenance workflow
    -F, --find                       Recursively find pacfiles instead of reading the pacman database
    -l, --locate                     Find pacfiles with locate instead of reading the pacman database
    -P, --pacmandb                   Search backup paths from the local pacman database (default)
    -b, --backup                     Save the old original as .bak before overwriting
    -C, --cachedir <cachedir>        Package cache directory for three-way base archives; repeat to add directories
    -o, --output                     Print discovered pacfile paths without modifying them
    -s, --sudo                       Explicitly request elevation; interactive pacfile maintenance elevates automatically
    -3, --threeway                   Use a cached older package as the third input when viewing differences
    --nocolor                        Disable colored pacfile status output
    --search-path <search-path>      Path to scan with --find; repeat to add paths
    --diff-program <diff-program>    Diff command, overriding DIFFPROG
    --merge-program <merge-program>  Merge command, overriding MERGEPROG
  repository only:
    -a, --add                    Add the named repository (requires name and url)
    -x, --remove                 Remove the named repository
    -l, --list                   List configured repositories
    -n, --no-sync                Skip the final database refresh
    -s, --lsign-key <lsign-key>  Key to locally sign with pacman-key before adding

Commands:
  shelly utility utility                  Run Shelly maintenance, pacnew/pacsave management, and command-catalog generators.
  shelly utility repository <name> <url>  Add, remove, or list pacman.conf ALPM repositories; optionally locally sign a key and refresh databases. [shortcode: -Tr]

Examples:
  -T                    shelly utility utility
  -Tr [<name>] [<url>]  shelly utility repository [<name>] [<url>]

Unrecognized command or argument '-Tc'.


    [Ribbon]️  ) ~ ))) @ 21:33 )
> shelly -T
No utility operation selected. Use --fix-permissions, --repair-db, --docs, --completions <shell>, or --pacfiles.

    [Ribbon]️  ) ~ ))) @ 21:34 )
> shelly -T --completions fish
# Fish completions for shelly
# Auto-generated from the native Shelly CLI catalog. Do not edit.
function __shelly_packages_standard_sync
    pacman -Slq 2>/dev/null
end

function __shelly_packages_standard_local
    pacman -Qq 2>/dev/null
end

function __shelly_packages_aur_local
    pacman -Qqm 2>/dev/null
end

function __shelly_packages_flatpak_remote
    flatpak remote-ls --app --columns=application 2>/dev/null
end

function __shelly_packages_flatpak_local
    flatpak list --app --columns=application 2>/dev/null
end

function __shelly_shortcut
    set -l cmd (commandline -opc)
    test (count $cmd) -ge 2; and contains -- $cmd[2] $argv
end

complete -c shelly -f
complete -c shelly -f -l help -s ? -s h -d 'Show command-specific help and usage information'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -l version -s V -d 'Show version information'
complete -c shelly -f -l no-confirm -s n -d 'Use safe automatic answers instead of prompting'
complete -c shelly -f -l ui-mode -s U -d 'Emit framed output for the Shelly UI'
complete -c shelly -f -l json -s j -d 'Output structured JSON where the command supports it'

complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ss' -d 'Search ALPM repository and installed packages, or Shelly-managed local binary packages. With a package and no source modifier, show exact package details.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Sa' -d 'Search the AUR RPC, fetch exact package PKGBUILDs, append high-confidence standard repository matches, or show complete metadata for one AUR package.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Sf' -d 'Search cached AppStream catalogs from every configured system and user Flatpak remote, with local pagination and remote-reference sizes and permissions.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Is' -d 'Install ALPM repository packages, local Arch or Shelly binary archives, and package archives downloaded from HTTP(S) URLs.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ii' -d 'Install a local AppImage into the configured AppImage directory and update Shelly\'s AppImage metadata database.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ia' -d 'Fetch, review, build, and install one or more AUR packages, install one package\'s build dependencies, or install one package at an exact Git commit.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-If' -d 'Install a Flatpak application, runtime, .flatpakref file, or bundle, or repair an installed Flatpak while preserving its configuration.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Us' -d 'Synchronize ALPM repositories, show the available repository package upgrades, perform a full system upgrade, and report required restarts.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ux' -d 'Build and confirm an invoking-user upgrade plan, then upgrade every enabled package backend in one coordinated action, continuing through independent backend failures and returning failure if any selected backend fails.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ui' -d 'Check every configured AppImage update source and replace each AppImage for which a newer version is available.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ua' -d 'Find installed foreign packages with newer AUR or VCS revisions, then build and install all available upgrades.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Uf' -d 'Upgrade every application and runtime with an available update in the system and user Flatpak installations.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Mg' -d 'List or modify packages excluded from ALPM upgrades through IgnorePkg.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Mo' -d 'List or modify packages protected from removal through HoldPkg.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Me' -d 'Mark an installed ALPM package as explicitly installed.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Md' -d 'Mark an installed ALPM package as installed as a dependency.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Px' -d 'Query available updates from every supported package backend, continuing through independent backend failures.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ps' -d 'List available standard repository package updates.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Pi' -d 'List installed AppImages with available updates.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Pa' -d 'List installed AUR packages with available updates.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Pf' -d 'List Flatpak applications and runtimes with available updates.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ls' -d 'List packages installed in the local ALPM database, with optional IgnorePkg and install-reason filters.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Li' -d 'List installed AppImages.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-LI' -d 'List installed AppImages.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-La' -d 'List installed foreign packages tracked as AUR packages.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-LA' -d 'List installed foreign packages tracked as AUR packages.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Lf' -d 'List installed Flatpaks, configured system and user remotes, or cached AppStream JSON for one or every remote.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-LF' -d 'List installed Flatpaks, configured system and user remotes, or cached AppStream JSON for one or every remote.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Tr' -d 'Add, remove, or list pacman.conf ALPM repositories; optionally locally sign a key and refresh databases.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Zs' -d 'Plan corrupted archives, optional orphan cleanup, and optional cache retention cleanup; show the targets, then confirm before changing ALPM or cache state.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Zf' -d 'Plan unused dependency cleanup across system and user Flatpak installations, then show and confirm the targets.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Rs' -d 'Remove installed ALPM packages or Shelly-managed local binaries, with optional dependency and configuration cleanup.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-RS' -d 'Remove installed ALPM packages or Shelly-managed local binaries, with optional dependency and configuration cleanup.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ri' -d 'Remove an installed AppImage and optionally delete its associated configuration.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-RI' -d 'Remove an installed AppImage and optionally delete its associated configuration.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ra' -d 'Remove installed AUR packages and optionally remove dependent or optional packages through ALPM.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-RA' -d 'Remove installed AUR packages and optionally remove dependent or optional packages through ALPM.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Rf' -d 'Remove an installed Flatpak application or runtime, with optional unused dependency and configuration cleanup.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-RF' -d 'Remove an installed Flatpak application or runtime, with optional unused dependency and configuration cleanup.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ys' -d 'Synchronize the configured ALPM package databases; use --force to refresh databases even when they appear current.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Yi' -d 'Synchronize extracted AppImage metadata, or configure an installed AppImage\'s update source with the appimage/url/type overload.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Yf' -d 'Update cached AppStream metadata, or add and remove configured system or user Flatpak remotes.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Es' -d 'Update only the named installed ALPM packages after an explicit partial-upgrade warning and confirmation.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ea' -d 'Fetch, review, rebuild, and reinstall only the named AUR packages.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ef' -d 'Update one installed Flatpak application or runtime in its existing user or system installation.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Cg' -d 'Read a Shelly configuration value.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Cs' -d 'Set a Shelly configuration value.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Cr' -d 'Reset Shelly configuration to native defaults.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Cp' -d 'Set Shelly\'s parallel download count.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ki' -d 'Initialize the pacman keyring.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Kl' -d 'List keys in the pacman keyring.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Kr' -d 'Refresh pacman keyring keys from the configured keyserver.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Ks' -d 'Locally sign one or more keys in the pacman keyring.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Kp' -d 'Populate the pacman keyring with default or named distribution keys.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Kv' -d 'Receive one or more keys from the configured or requested keyserver.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Xf' -d 'Launch an installed Flatpak application, stop it with --kill, or list running instances with `run flatpak list`.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a '-Xi' -d 'Launch an installed AppImage, or stop it with --kill.'
complete -c shelly -f -n '__shelly_shortcut -Ss' -l repos -s r -d 'List repositories parsed from pacman.conf and ignore other search modifiers'
complete -c shelly -f -n '__shelly_shortcut -Ss' -l available -s v -d 'Search packages from the configured ALPM synchronization databases'
complete -c shelly -f -n '__shelly_shortcut -Ss' -l installed -s i -d 'Search packages from the local ALPM database'
complete -c shelly -f -n '__shelly_shortcut -Ss' -l local -s l -d 'Search Shelly-managed binary packages installed under /opt/shelly'
complete -c shelly -f -n '__shelly_shortcut -Ss' -l limit -s t -d 'Maximum number of search results to return per page' -r
complete -c shelly -f -n '__shelly_shortcut -Ss' -l page -s p -d 'Page number for paginated results' -r
complete -c shelly -f -n '__shelly_shortcut -Ss' -l show-hidden -s w -d 'Include packages hidden by pacman IgnorePkg configuration'
complete -c shelly -f -n '__shelly_shortcut -Ss' -l detail -l info -s d -d 'Show complete metadata for one exact ALPM package name'
complete -c shelly -f -n '__shelly_shortcut -Ss' -l group -s g -d 'List package groups or restrict available packages to the requested group'
complete -c shelly -f -n '__shelly_shortcut -Ss' -l explicit -s e -d 'Shows only explicitly installed pacakges'
complete -c shelly -f -n '__shelly_shortcut -Ss' -l depends -s D -d 'Shows only dependency packages'
complete -c shelly -f -n '__shelly_shortcut -Ss' -a '(__shelly_packages_standard_sync)'
complete -c shelly -f -n '__shelly_shortcut -Sa' -l standard -s s -d 'Append high-confidence standard ALPM repository matches to the AUR results'
complete -c shelly -f -n '__shelly_shortcut -Sa' -l pkgbuild -s p -d 'Fetch and display the PKGBUILD for each exact AUR package name'
complete -c shelly -f -n '__shelly_shortcut -Sa' -l detail -l info -s d -d 'Show complete metadata for one exact AUR package name'
complete -c shelly -f -n '__shelly_shortcut -Sf' -l limit -s t -d 'Maximum number of search results to return per page' -r
complete -c shelly -f -n '__shelly_shortcut -Sf' -l page -s p -d 'Page number for paginated results' -r
complete -c shelly -f -n '__shelly_shortcut -Sf' -a '(__shelly_packages_flatpak_remote)'
complete -c shelly -f -n '__shelly_shortcut -Is' -l build-deps -s b -d 'Install build dependencies for the requested packages'
complete -c shelly -f -n '__shelly_shortcut -Is' -l make-deps -s m -d 'Install make dependencies for the requested packages'
complete -c shelly -f -n '__shelly_shortcut -Is' -l no-deps -s d -d 'Pass the ALPM nodeps transaction flag when installing repository packages'
complete -c shelly -f -n '__shelly_shortcut -Is' -l upgrade -s u -d 'After confirmation, synchronize and upgrade the standard system before installing the requested repository packages'
complete -c shelly -f -n '__shelly_shortcut -Is' -a '(__shelly_packages_standard_sync)'
complete -c shelly -f -n '__shelly_shortcut -Ii' -l install-path -d 'Directory to install the AppImage into; overrides the configured AppImageInstallPath' -r
complete -c shelly -f -n '__shelly_shortcut -Ii' -a '(__fish_complete_suffix .AppImage)'
complete -c shelly -f -n '__shelly_shortcut -Ia' -l build-deps -s b -d 'Install build dependencies for the requested packages'
complete -c shelly -f -n '__shelly_shortcut -Ia' -l make-deps -s m -d 'Install make dependencies for the requested packages'
complete -c shelly -f -n '__shelly_shortcut -Ia' -l chroot -s c -d 'Build packages in a clean chroot with makechrootpkg'
complete -c shelly -f -n '__shelly_shortcut -Ia' -l check -d 'Enable the PKGBUILD check() function during package builds'
complete -c shelly -f -n '__shelly_shortcut -Ia' -l version -s v -d 'Install exactly one AUR package from the following Git commit operand'
complete -c shelly -f -n '__shelly_shortcut -If' -l user -d 'Install into the invoking user\'s Flatpak installation instead of the system installation'
complete -c shelly -f -n '__shelly_shortcut -If' -l remote -s r -d 'Install from this remote instead of resolving a remote from cached AppStream metadata' -r
complete -c shelly -f -n '__shelly_shortcut -If' -l branch -s b -d 'Install this branch; defaults to the branch the remote publishes for the package' -r
complete -c shelly -f -n '__shelly_shortcut -If' -l runtime -d 'Build a runtime ref instead of an application ref'
complete -c shelly -f -n '__shelly_shortcut -If' -l ref-file -s e -d 'Treat the package operand as a local .flatpakref file'
complete -c shelly -f -n '__shelly_shortcut -If' -l bundle -s u -d 'Treat the package operand as a local Flatpak bundle'
complete -c shelly -f -n '__shelly_shortcut -If' -l repair -s f -d 'Reinstall the installed Flatpak and its dependencies while preserving application configuration'
complete -c shelly -f -n '__shelly_shortcut -If' -a '(__shelly_packages_flatpak_remote)'
complete -c shelly -f -n '__shelly_shortcut -Us' -l all -s a -d 'Upgrade standard, AUR, Flatpak, and AppImage backends'
complete -c shelly -f -n '__shelly_shortcut -Ux' -l no-repo -d 'Skip the standard ALPM backend'
complete -c shelly -f -n '__shelly_shortcut -Ux' -l no-aur -d 'Skip the AUR backend'
complete -c shelly -f -n '__shelly_shortcut -Ux' -l no-flatpak -d 'Skip the Flatpak backend'
complete -c shelly -f -n '__shelly_shortcut -Ux' -l no-appimage -d 'Skip the AppImage backend'
complete -c shelly -f -n '__shelly_shortcut -Ux' -l no-devel -d 'Skip -git aur'
complete -c shelly -f -n '__shelly_shortcut -Ua' -l check -d 'Run each PKGBUILD check() function during AUR upgrade builds'
complete -c shelly -f -n '__shelly_shortcut -Ua' -l singlepane -d 'Use the shared pacman-style linear output (already the native Zig non-UI output mode)'
complete -c shelly -f -n '__shelly_shortcut -Ua' -l no-devel -d 'Skip checking -git packages'
complete -c shelly -f -n '__shelly_shortcut -Mg' -l list -s l -d 'List packages in IgnorePkg'
complete -c shelly -f -n '__shelly_shortcut -Mg' -l add -s a -d 'Add packages to IgnorePkg'
complete -c shelly -f -n '__shelly_shortcut -Mg' -l remove -s r -d 'Remove packages from IgnorePkg'
complete -c shelly -f -n '__shelly_shortcut -Mg' -l clear -s c -d 'Clear IgnorePkg'
complete -c shelly -f -n '__shelly_shortcut -Mo' -l list -s l -d 'List packages in HoldPkg'
complete -c shelly -f -n '__shelly_shortcut -Mo' -l add -s a -d 'Add packages to HoldPkg'
complete -c shelly -f -n '__shelly_shortcut -Mo' -l remove -s r -d 'Remove packages from HoldPkg'
complete -c shelly -f -n '__shelly_shortcut -Mo' -l clear -s c -d 'Clear HoldPkg except for Shelly\'s protected entry'
complete -c shelly -f -n '__shelly_shortcut -Px' -l show-hidden -d 'Include hidden packages'
complete -c shelly -f -n '__shelly_shortcut -Px' -l no-devel -d 'Does not check for -git builds'
complete -c shelly -f -n '__shelly_shortcut -Pa' -l show-hidden -d 'Include hidden packages'
complete -c shelly -f -n '__shelly_shortcut -Pa' -l no-devel -d 'Does not check for -git builds'
complete -c shelly -f -n '__shelly_shortcut -Ls' -l show-hidden -s w -d 'Include hidden packages'
complete -c shelly -f -n '__shelly_shortcut -Ls' -l explicitOnly -s e -d 'List explicitly installed packages only'
complete -c shelly -f -n '__shelly_shortcut -Ls' -l dependencyOnly -s d -d 'List dependency-installed packages only'
complete -c shelly -f -n '__shelly_shortcut -Ls' -l required-by -d 'Include packages that directly require each listed package'
complete -c shelly -f -n '__shelly_shortcut -Ls' -l optional-for -d 'Include packages that directly use each listed package optionally'
complete -c shelly -f -n '__shelly_shortcut -La -LA' -l show-hidden -d 'Include hidden packages'
complete -c shelly -f -n '__shelly_shortcut -La -LA' -l explicitOnly -s e -d 'List explicitly installed packages only'
complete -c shelly -f -n '__shelly_shortcut -La -LA' -l dependencyOnly -s d -d 'List dependency-installed packages only'
complete -c shelly -f -n '__shelly_shortcut -La -LA' -l required-by -d 'Include packages that directly require each listed package'
complete -c shelly -f -n '__shelly_shortcut -La -LA' -l optional-for -d 'Include packages that directly use each listed package optionally'
complete -c shelly -f -n '__shelly_shortcut -Tr' -l add -s a -d 'Add the named repository (requires name and url)'
complete -c shelly -f -n '__shelly_shortcut -Tr' -l remove -s x -d 'Remove the named repository'
complete -c shelly -f -n '__shelly_shortcut -Tr' -l list -s l -d 'List configured repositories'
complete -c shelly -f -n '__shelly_shortcut -Tr' -l no-sync -s n -d 'Skip the final database refresh'
complete -c shelly -f -n '__shelly_shortcut -Tr' -l lsign-key -s s -d 'Key to locally sign with pacman-key before adding' -r
complete -c shelly -f -n '__shelly_shortcut -Zs' -l dry-run -s d -d 'Show the cleanup plan without changing packages'
complete -c shelly -f -n '__shelly_shortcut -Zs' -l orphans -s o -d 'Include orphaned packages'
complete -c shelly -f -n '__shelly_shortcut -Zs' -l cache -s c -d 'Remove older cached package versions while retaining this many versions' -r
complete -c shelly -f -n '__shelly_shortcut -Rs -RS' -l cascade -s c -d 'Remove dependencies that are no longer needed'
complete -c shelly -f -n '__shelly_shortcut -Rs -RS' -l no-cascade -d 'Keep dependencies that become unneeded after removal'
complete -c shelly -f -n '__shelly_shortcut -Rs -RS' -l opt-deps -s o -d 'Remove unused optional dependencies installed with the packages'
complete -c shelly -f -n '__shelly_shortcut -Rs -RS' -l ripple -s i -d 'Remove packages that depend on the removed packages'
complete -c shelly -f -n '__shelly_shortcut -Rs -RS' -l remove-config -d 'Remove configuration associated with the removed package'
complete -c shelly -f -n '__shelly_shortcut -Rs -RS' -l local -s l -d 'Remove Shelly-managed local binaries'
complete -c shelly -f -n '__shelly_shortcut -Rs -RS' -l force -s f -d 'Force local binary removal'
complete -c shelly -f -n '__shelly_shortcut -Rs -RS' -a '(__shelly_packages_standard_local)'
complete -c shelly -f -n '__shelly_shortcut -Ri -RI' -l remove-config -d 'Remove configuration associated with the removed package'
complete -c shelly -f -n '__shelly_shortcut -Ra -RA' -l cascade -s c -d 'Remove dependencies that are no longer needed'
complete -c shelly -f -n '__shelly_shortcut -Ra -RA' -l opt-deps -s o -d 'Remove unused optional dependencies installed with the packages'
complete -c shelly -f -n '__shelly_shortcut -Ra -RA' -l ripple -s i -d 'Remove packages that depend on the removed packages'
complete -c shelly -f -n '__shelly_shortcut -Ra -RA' -a '(__shelly_packages_aur_local)'
complete -c shelly -f -n '__shelly_shortcut -Rf -RF' -l remove-unused -s r -d 'Remove newly unused Flatpak dependencies'
complete -c shelly -f -n '__shelly_shortcut -Rf -RF' -l remove-config -d 'Remove configuration associated with the removed package'
complete -c shelly -f -n '__shelly_shortcut -Rf -RF' -a '(__shelly_packages_flatpak_local)'
complete -c shelly -f -n '__shelly_shortcut -Ys' -l force -s f -d 'Force every configured ALPM package database to refresh'
complete -c shelly -f -n '__shelly_shortcut -Yi' -l prerelease -s p -d 'Allow prerelease versions for the configured update source'
complete -c shelly -f -n '__shelly_shortcut -Yf' -l remote-url -s u -d 'Remote URL or .flatpakrepo URL; required for remote add' -r
complete -c shelly -f -n '__shelly_shortcut -Yf' -l system -s s -d 'Use system scope; defaults to true'
complete -c shelly -f -n '__shelly_shortcut -Yf' -l gpg-verify -s g -d 'Enable GPG verification when adding; defaults to true'
complete -c shelly -f -n '__shelly_shortcut -Ea' -l check -d 'Run each PKGBUILD check() function during the rebuild'
complete -c shelly -f -n '__shelly_shortcut -Kv' -l keyserver -d 'Keyserver from which to receive keys' -r
complete -c shelly -f -n '__shelly_shortcut -Xf' -l kill -s k -d 'Stop the selected application instead of launching it'
complete -c shelly -f -n '__shelly_shortcut -Xf' -l list -s l -d 'List running Flatpak applications and process identifiers'
complete -c shelly -f -n '__shelly_shortcut -Xi' -l kill -s k -d 'Stop the selected application instead of launching it'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'search' -d 'Search ALPM repositories, the AUR, or cached Flatpak AppStream catalogs.'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and not __fish_seen_subcommand_from standard aur flatpak' -a 'standard' -d 'Search ALPM repository and installed packages, or Shelly-managed local binary packages. With a package and no source modifier, show exact package details.'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and not __fish_seen_subcommand_from standard aur flatpak' -a 'aur' -d 'Search the AUR RPC, fetch exact package PKGBUILDs, append high-confidence standard repository matches, or show complete metadata for one AUR package.'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and not __fish_seen_subcommand_from standard aur flatpak' -a 'flatpak' -d 'Search cached AppStream catalogs from every configured system and user Flatpak remote, with local pagination and remote-reference sizes and permissions.'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l repos -s r -d 'List repositories parsed from pacman.conf and ignore other search modifiers'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l available -s v -d 'Search packages from the configured ALPM synchronization databases'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l installed -s i -d 'Search packages from the local ALPM database'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l local -s l -d 'Search Shelly-managed binary packages installed under /opt/shelly'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l limit -s t -d 'Maximum number of search results to return per page' -r
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l page -s p -d 'Page number for paginated results' -r
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l show-hidden -s w -d 'Include packages hidden by pacman IgnorePkg configuration'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l detail -l info -s d -d 'Show complete metadata for one exact ALPM package name'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l group -s g -d 'List package groups or restrict available packages to the requested group'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l explicit -s e -d 'Shows only explicitly installed pacakges'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -l depends -s D -d 'Shows only dependency packages'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from standard' -a '(__shelly_packages_standard_sync)'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from aur' -l standard -s s -d 'Append high-confidence standard ALPM repository matches to the AUR results'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from aur' -l pkgbuild -s p -d 'Fetch and display the PKGBUILD for each exact AUR package name'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from aur' -l detail -l info -s d -d 'Show complete metadata for one exact AUR package name'
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from flatpak' -l limit -s t -d 'Maximum number of search results to return per page' -r
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from flatpak' -l page -s p -d 'Page number for paginated results' -r
complete -c shelly -f -n '__fish_seen_subcommand_from search; and __fish_seen_subcommand_from flatpak' -a '(__shelly_packages_flatpak_remote)'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'install' -d 'Install packages or applications from ALPM repositories, the AUR, AppImages, Flatpak remotes, or local Flatpak files, and repair installed Flatpaks.'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'standard' -d 'Install ALPM repository packages, local Arch or Shelly binary archives, and package archives downloaded from HTTP(S) URLs.'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'appimage' -d 'Install a local AppImage into the configured AppImage directory and update Shelly\'s AppImage metadata database.'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'aur' -d 'Fetch, review, build, and install one or more AUR packages, install one package\'s build dependencies, or install one package at an exact Git commit.'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'flatpak' -d 'Install a Flatpak application, runtime, .flatpakref file, or bundle, or repair an installed Flatpak while preserving its configuration.'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from standard' -l build-deps -s b -d 'Install build dependencies for the requested packages'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from standard' -l make-deps -s m -d 'Install make dependencies for the requested packages'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from standard' -l no-deps -s d -d 'Pass the ALPM nodeps transaction flag when installing repository packages'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from standard' -l upgrade -s u -d 'After confirmation, synchronize and upgrade the standard system before installing the requested repository packages'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from standard' -a '(__shelly_packages_standard_sync)'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from appimage' -l install-path -d 'Directory to install the AppImage into; overrides the configured AppImageInstallPath' -r
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from appimage' -a '(__fish_complete_suffix .AppImage)'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from aur' -l build-deps -s b -d 'Install build dependencies for the requested packages'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from aur' -l make-deps -s m -d 'Install make dependencies for the requested packages'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from aur' -l chroot -s c -d 'Build packages in a clean chroot with makechrootpkg'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from aur' -l check -d 'Enable the PKGBUILD check() function during package builds'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from aur' -l version -s v -d 'Install exactly one AUR package from the following Git commit operand'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from flatpak' -l user -d 'Install into the invoking user\'s Flatpak installation instead of the system installation'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from flatpak' -l remote -s r -d 'Install from this remote instead of resolving a remote from cached AppStream metadata' -r
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from flatpak' -l branch -s b -d 'Install this branch; defaults to the branch the remote publishes for the package' -r
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from flatpak' -l runtime -d 'Build a runtime ref instead of an application ref'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from flatpak' -l ref-file -s e -d 'Treat the package operand as a local .flatpakref file'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from flatpak' -l bundle -s u -d 'Treat the package operand as a local Flatpak bundle'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from flatpak' -l repair -s f -d 'Reinstall the installed Flatpak and its dependencies while preserving application configuration'
complete -c shelly -f -n '__fish_seen_subcommand_from install; and __fish_seen_subcommand_from flatpak' -a '(__shelly_packages_flatpak_remote)'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'upgrade' -d 'Upgrade standard, AUR, AppImage, or Flatpak packages, including all supported backends together.'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from standard all appimage aur flatpak' -a 'standard' -d 'Synchronize ALPM repositories, show the available repository package upgrades, perform a full system upgrade, and report required restarts.'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from standard all appimage aur flatpak' -a 'all' -d 'Build and confirm an invoking-user upgrade plan, then upgrade every enabled package backend in one coordinated action, continuing through independent backend failures and returning failure if any selected backend fails.'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from standard all appimage aur flatpak' -a 'appimage' -d 'Check every configured AppImage update source and replace each AppImage for which a newer version is available.'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from standard all appimage aur flatpak' -a 'aur' -d 'Find installed foreign packages with newer AUR or VCS revisions, then build and install all available upgrades.'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and not __fish_seen_subcommand_from standard all appimage aur flatpak' -a 'flatpak' -d 'Upgrade every application and runtime with an available update in the system and user Flatpak installations.'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and __fish_seen_subcommand_from standard' -l all -s a -d 'Upgrade standard, AUR, Flatpak, and AppImage backends'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and __fish_seen_subcommand_from all' -l no-repo -d 'Skip the standard ALPM backend'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and __fish_seen_subcommand_from all' -l no-aur -d 'Skip the AUR backend'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and __fish_seen_subcommand_from all' -l no-flatpak -d 'Skip the Flatpak backend'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and __fish_seen_subcommand_from all' -l no-appimage -d 'Skip the AppImage backend'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and __fish_seen_subcommand_from all' -l no-devel -d 'Skip -git aur'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and __fish_seen_subcommand_from aur' -l check -d 'Run each PKGBUILD check() function during AUR upgrade builds'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and __fish_seen_subcommand_from aur' -l singlepane -d 'Use the shared pacman-style linear output (already the native Zig non-UI output mode)'
complete -c shelly -f -n '__fish_seen_subcommand_from upgrade; and __fish_seen_subcommand_from aur' -l no-devel -d 'Skip checking -git packages'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'downgrade' -d 'Select and install an older version of a standard package.'
complete -c shelly -f -n '__fish_seen_subcommand_from downgrade' -l oldest -s o -d 'Select the oldest available version instead of prompting or selecting the newest version'
complete -c shelly -f -n '__fish_seen_subcommand_from downgrade' -l ignore -s i -d 'Add the package to IgnorePkg after a successful downgrade'
complete -c shelly -f -n '__fish_seen_subcommand_from downgrade' -l list-options -s l -d 'List cached and archived versions without installing one'
complete -c shelly -f -n '__fish_seen_subcommand_from downgrade' -l target -s t -d 'Install an exact version-release or package filename' -r
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'mark' -d 'Manage IgnorePkg and HoldPkg package marks, or change an installed package\'s explicit/dependency reason.'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and not __fish_seen_subcommand_from ignore hold explicit dependency' -a 'ignore' -d 'List or modify packages excluded from ALPM upgrades through IgnorePkg.'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and not __fish_seen_subcommand_from ignore hold explicit dependency' -a 'hold' -d 'List or modify packages protected from removal through HoldPkg.'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and not __fish_seen_subcommand_from ignore hold explicit dependency' -a 'explicit' -d 'Mark an installed ALPM package as explicitly installed.'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and not __fish_seen_subcommand_from ignore hold explicit dependency' -a 'dependency' -d 'Mark an installed ALPM package as installed as a dependency.'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and __fish_seen_subcommand_from ignore' -l list -s l -d 'List packages in IgnorePkg'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and __fish_seen_subcommand_from ignore' -l add -s a -d 'Add packages to IgnorePkg'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and __fish_seen_subcommand_from ignore' -l remove -s r -d 'Remove packages from IgnorePkg'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and __fish_seen_subcommand_from ignore' -l clear -s c -d 'Clear IgnorePkg'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and __fish_seen_subcommand_from hold' -l list -s l -d 'List packages in HoldPkg'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and __fish_seen_subcommand_from hold' -l add -s a -d 'Add packages to HoldPkg'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and __fish_seen_subcommand_from hold' -l remove -s r -d 'Remove packages from HoldPkg'
complete -c shelly -f -n '__fish_seen_subcommand_from mark; and __fish_seen_subcommand_from hold' -l clear -s c -d 'Clear HoldPkg except for Shelly\'s protected entry'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'news' -d 'Read Arch Linux news and track viewed entries.'
complete -c shelly -f -n '__fish_seen_subcommand_from news' -l all -s a -d 'Show previously viewed news as well as unread entries'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'list-updates' -d 'List available updates for standard, AUR, AppImage, or Flatpak packages.'
complete -c shelly -f -n '__fish_seen_subcommand_from list-updates; and not __fish_seen_subcommand_from all standard appimage aur flatpak' -a 'all' -d 'Query available updates from every supported package backend, continuing through independent backend failures.'
complete -c shelly -f -n '__fish_seen_subcommand_from list-updates; and not __fish_seen_subcommand_from all standard appimage aur flatpak' -a 'standard' -d 'List available standard repository package updates.'
complete -c shelly -f -n '__fish_seen_subcommand_from list-updates; and not __fish_seen_subcommand_from all standard appimage aur flatpak' -a 'appimage' -d 'List installed AppImages with available updates.'
complete -c shelly -f -n '__fish_seen_subcommand_from list-updates; and not __fish_seen_subcommand_from all standard appimage aur flatpak' -a 'aur' -d 'List installed AUR packages with available updates.'
complete -c shelly -f -n '__fish_seen_subcommand_from list-updates; and not __fish_seen_subcommand_from all standard appimage aur flatpak' -a 'flatpak' -d 'List Flatpak applications and runtimes with available updates.'
complete -c shelly -f -n '__fish_seen_subcommand_from list-updates; and __fish_seen_subcommand_from all' -l show-hidden -d 'Include hidden packages'
complete -c shelly -f -n '__fish_seen_subcommand_from list-updates; and __fish_seen_subcommand_from all' -l no-devel -d 'Does not check for -git builds'
complete -c shelly -f -n '__fish_seen_subcommand_from list-updates; and __fish_seen_subcommand_from aur' -l show-hidden -d 'Include hidden packages'
complete -c shelly -f -n '__fish_seen_subcommand_from list-updates; and __fish_seen_subcommand_from aur' -l no-devel -d 'Does not check for -git builds'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'list' -d 'List installed standard packages, AppImages, AUR packages, or Flatpak applications.'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'standard' -d 'List packages installed in the local ALPM database, with optional IgnorePkg and install-reason filters.'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'appimage' -d 'List installed AppImages.'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'aur' -d 'List installed foreign packages tracked as AUR packages.'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'flatpak' -d 'List installed Flatpaks, configured system and user remotes, or cached AppStream JSON for one or every remote.'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from standard' -l show-hidden -s w -d 'Include hidden packages'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from standard' -l explicitOnly -s e -d 'List explicitly installed packages only'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from standard' -l dependencyOnly -s d -d 'List dependency-installed packages only'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from standard' -l required-by -d 'Include packages that directly require each listed package'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from standard' -l optional-for -d 'Include packages that directly use each listed package optionally'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from aur' -l show-hidden -d 'Include hidden packages'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from aur' -l explicitOnly -s e -d 'List explicitly installed packages only'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from aur' -l dependencyOnly -s d -d 'List dependency-installed packages only'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from aur' -l required-by -d 'Include packages that directly require each listed package'
complete -c shelly -f -n '__fish_seen_subcommand_from list; and __fish_seen_subcommand_from aur' -l optional-for -d 'Include packages that directly use each listed package optionally'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'backup' -d 'Back up explicitly installed packages as type-grouped TOML.'
complete -c shelly -f -n '__fish_seen_subcommand_from backup' -l export -s e -d 'Exports a declaritive list of explicitly installed standard packages, AUR packages, and Flatpak applications'
complete -c shelly -f -n '__fish_seen_subcommand_from backup' -l import -s i -d 'Imports a previously exported backup and installs the latest versions of all items listed'
complete -c shelly -f -n '__fish_seen_subcommand_from backup' -l name -s a -d 'File name without the .toml extension' -r
complete -c shelly -f -n '__fish_seen_subcommand_from backup' -l directory -s d -d 'Directory in which to write/read the backup' -r
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'utility' -d 'Repair Shelly directory ownership, manage pacfiles, or generate CLI documentation and shell completions.'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from utility repository' -a 'repository' -d 'Add, remove, or list pacman.conf ALPM repositories; optionally locally sign a key and refresh databases.'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l fix-permissions -s f -d 'Restore the invoking user\'s ownership of Shelly\'s configuration, cache, and data directories'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l repair-db -s r -d 'Remove a stale database lock'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l docs -s d -d 'Write Markdown CLI reference documentation to standard output'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l completions -s c -d 'Write a Bash, Fish, or Zsh completion script to standard output' -r -a 'bash fish zsh'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l pacfiles -s p -d 'Run the pacdiff-compatible pacnew, pacorig, and pacsave maintenance workflow'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l find -s F -d 'Recursively find pacfiles instead of reading the pacman database'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l locate -s l -d 'Find pacfiles with locate instead of reading the pacman database'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l pacmandb -s P -d 'Search backup paths from the local pacman database (default)'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l backup -s b -d 'Save the old original as .bak before overwriting'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l cachedir -s C -d 'Package cache directory for three-way base archives; repeat to add directories' -r
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l output -s o -d 'Print discovered pacfile paths without modifying them'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l sudo -s s -d 'Explicitly request elevation; interactive pacfile maintenance elevates automatically'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l threeway -s 3 -d 'Use a cached older package as the third input when viewing differences'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l nocolor -d 'Disable colored pacfile status output'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l search-path -d 'Path to scan with --find; repeat to add paths' -r
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l diff-program -d 'Diff command, overriding DIFFPROG' -r
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and not __fish_seen_subcommand_from repository' -l merge-program -d 'Merge command, overriding MERGEPROG' -r
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and __fish_seen_subcommand_from repository' -l add -s a -d 'Add the named repository (requires name and url)'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and __fish_seen_subcommand_from repository' -l remove -s x -d 'Remove the named repository'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and __fish_seen_subcommand_from repository' -l list -s l -d 'List configured repositories'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and __fish_seen_subcommand_from repository' -l no-sync -s n -d 'Skip the final database refresh'
complete -c shelly -f -n '__fish_seen_subcommand_from utility; and __fish_seen_subcommand_from repository' -l lsign-key -s s -d 'Key to locally sign with pacman-key before adding' -r
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'purify' -d 'Remove corrupted or orphaned ALPM packages, optionally clean the package cache, or remove unused Flatpak dependencies.'
complete -c shelly -f -n '__fish_seen_subcommand_from purify; and not __fish_seen_subcommand_from standard flatpak' -a 'standard' -d 'Plan corrupted archives, optional orphan cleanup, and optional cache retention cleanup; show the targets, then confirm before changing ALPM or cache state.'
complete -c shelly -f -n '__fish_seen_subcommand_from purify; and not __fish_seen_subcommand_from standard flatpak' -a 'flatpak' -d 'Plan unused dependency cleanup across system and user Flatpak installations, then show and confirm the targets.'
complete -c shelly -f -n '__fish_seen_subcommand_from purify; and __fish_seen_subcommand_from standard' -l dry-run -s d -d 'Show the cleanup plan without changing packages'
complete -c shelly -f -n '__fish_seen_subcommand_from purify; and __fish_seen_subcommand_from standard' -l orphans -s o -d 'Include orphaned packages'
complete -c shelly -f -n '__fish_seen_subcommand_from purify; and __fish_seen_subcommand_from standard' -l cache -s c -d 'Remove older cached package versions while retaining this many versions' -r
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'remove' -d 'Remove standard or local packages, AUR packages, AppImages, or Flatpak applications.'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'standard' -d 'Remove installed ALPM packages or Shelly-managed local binaries, with optional dependency and configuration cleanup.'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'appimage' -d 'Remove an installed AppImage and optionally delete its associated configuration.'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'aur' -d 'Remove installed AUR packages and optionally remove dependent or optional packages through ALPM.'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and not __fish_seen_subcommand_from standard appimage aur flatpak' -a 'flatpak' -d 'Remove an installed Flatpak application or runtime, with optional unused dependency and configuration cleanup.'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from standard' -l cascade -s c -d 'Remove dependencies that are no longer needed'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from standard' -l no-cascade -d 'Keep dependencies that become unneeded after removal'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from standard' -l opt-deps -s o -d 'Remove unused optional dependencies installed with the packages'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from standard' -l ripple -s i -d 'Remove packages that depend on the removed packages'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from standard' -l remove-config -d 'Remove configuration associated with the removed package'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from standard' -l local -s l -d 'Remove Shelly-managed local binaries'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from standard' -l force -s f -d 'Force local binary removal'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from standard' -a '(__shelly_packages_standard_local)'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from appimage' -l remove-config -d 'Remove configuration associated with the removed package'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from aur' -l cascade -s c -d 'Remove dependencies that are no longer needed'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from aur' -l opt-deps -s o -d 'Remove unused optional dependencies installed with the packages'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from aur' -l ripple -s i -d 'Remove packages that depend on the removed packages'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from aur' -a '(__shelly_packages_aur_local)'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from flatpak' -l remove-unused -s r -d 'Remove newly unused Flatpak dependencies'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from flatpak' -l remove-config -d 'Remove configuration associated with the removed package'
complete -c shelly -f -n '__fish_seen_subcommand_from remove; and __fish_seen_subcommand_from flatpak' -a '(__shelly_packages_flatpak_local)'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'sync' -d 'Synchronize ALPM package databases, AppImage metadata, or cached Flatpak AppStream metadata.'
complete -c shelly -f -n '__fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from standard appimage flatpak' -a 'appimage' -d 'Synchronize extracted AppImage metadata, or configure an installed AppImage\'s update source with the appimage/url/type overload.'
complete -c shelly -f -n '__fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from standard appimage flatpak' -a 'flatpak' -d 'Update cached AppStream metadata, or add and remove configured system or user Flatpak remotes.'
complete -c shelly -f -n '__fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from appimage; and not __fish_seen_subcommand_from flatpak' -l force -s f -d 'Force every configured ALPM package database to refresh'
complete -c shelly -f -n '__fish_seen_subcommand_from sync; and __fish_seen_subcommand_from appimage' -l prerelease -s p -d 'Allow prerelease versions for the configured update source'
complete -c shelly -f -n '__fish_seen_subcommand_from sync; and __fish_seen_subcommand_from flatpak' -l remote-url -s u -d 'Remote URL or .flatpakrepo URL; required for remote add' -r
complete -c shelly -f -n '__fish_seen_subcommand_from sync; and __fish_seen_subcommand_from flatpak' -l system -s s -d 'Use system scope; defaults to true'
complete -c shelly -f -n '__fish_seen_subcommand_from sync; and __fish_seen_subcommand_from flatpak' -l gpg-verify -s g -d 'Enable GPG verification when adding; defaults to true'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'update' -d 'Update selected standard, AUR, or Flatpak packages.'
complete -c shelly -f -n '__fish_seen_subcommand_from update; and not __fish_seen_subcommand_from standard aur flatpak' -a 'standard' -d 'Update only the named installed ALPM packages after an explicit partial-upgrade warning and confirmation.'
complete -c shelly -f -n '__fish_seen_subcommand_from update; and not __fish_seen_subcommand_from standard aur flatpak' -a 'aur' -d 'Fetch, review, rebuild, and reinstall only the named AUR packages.'
complete -c shelly -f -n '__fish_seen_subcommand_from update; and not __fish_seen_subcommand_from standard aur flatpak' -a 'flatpak' -d 'Update one installed Flatpak application or runtime in its existing user or system installation.'
complete -c shelly -f -n '__fish_seen_subcommand_from update; and __fish_seen_subcommand_from aur' -l check -d 'Run each PKGBUILD check() function during the rebuild'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'config' -d 'Read and modify Shelly configuration.'
complete -c shelly -f -n '__fish_seen_subcommand_from config; and not __fish_seen_subcommand_from list get set reset parallel' -a 'get' -d 'Read a Shelly configuration value.'
complete -c shelly -f -n '__fish_seen_subcommand_from config; and not __fish_seen_subcommand_from list get set reset parallel' -a 'set' -d 'Set a Shelly configuration value.'
complete -c shelly -f -n '__fish_seen_subcommand_from config; and not __fish_seen_subcommand_from list get set reset parallel' -a 'reset' -d 'Reset Shelly configuration to native defaults.'
complete -c shelly -f -n '__fish_seen_subcommand_from config; and not __fish_seen_subcommand_from list get set reset parallel' -a 'parallel' -d 'Set Shelly\'s parallel download count.'
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'keyring' -d 'Initialize, inspect, refresh, populate, receive, or locally sign keys in the pacman keyring.'
complete -c shelly -f -n '__fish_seen_subcommand_from keyring; and not __fish_seen_subcommand_from init list refresh lsign populate recv' -a 'init' -d 'Initialize the pacman keyring.'
complete -c shelly -f -n '__fish_seen_subcommand_from keyring; and not __fish_seen_subcommand_from init list refresh lsign populate recv' -a 'list' -d 'List keys in the pacman keyring.'
complete -c shelly -f -n '__fish_seen_subcommand_from keyring; and not __fish_seen_subcommand_from init list refresh lsign populate recv' -a 'refresh' -d 'Refresh pacman keyring keys from the configured keyserver.'
complete -c shelly -f -n '__fish_seen_subcommand_from keyring; and not __fish_seen_subcommand_from init list refresh lsign populate recv' -a 'lsign' -d 'Locally sign one or more keys in the pacman keyring.'
complete -c shelly -f -n '__fish_seen_subcommand_from keyring; and not __fish_seen_subcommand_from init list refresh lsign populate recv' -a 'populate' -d 'Populate the pacman keyring with default or named distribution keys.'
complete -c shelly -f -n '__fish_seen_subcommand_from keyring; and not __fish_seen_subcommand_from init list refresh lsign populate recv' -a 'recv' -d 'Receive one or more keys from the configured or requested keyserver.'
complete -c shelly -f -n '__fish_seen_subcommand_from keyring; and __fish_seen_subcommand_from recv' -l keyserver -d 'Keyserver from which to receive keys' -r
complete -c shelly -f -n '__fish_use_subcommand; and not __shelly_shortcut -Ss -Sa -Sf -Is -Ii -Ia -If -Us -Ux -Ui -Ua -Uf -Mg -Mo -Me -Md -Px -Ps -Pi -Pa -Pf -Ls -Li -LI -La -LA -Lf -LF -Tr -Zs -Zf -Rs -RS -Ri -RI -Ra -RA -Rf -RF -Ys -Yi -Yf -Es -Ea -Ef -Cg -Cs -Cr -Cp -Ki -Kl -Kr -Ks -Kp -Kv -Xf -Xi' -a 'run' -d 'Launch or stop a Flatpak or AppImage application.'
complete -c shelly -f -n '__fish_seen_subcommand_from run; and not __fish_seen_subcommand_from flatpak appimage' -a 'flatpak' -d 'Launch an installed Flatpak application, stop it with --kill, or list running instances with `run flatpak list`.'
complete -c shelly -f -n '__fish_seen_subcommand_from run; and not __fish_seen_subcommand_from flatpak appimage' -a 'appimage' -d 'Launch an installed AppImage, or stop it with --kill.'
complete -c shelly -f -n '__fish_seen_subcommand_from run; and __fish_seen_subcommand_from flatpak' -l kill -s k -d 'Stop the selected application instead of launching it'
complete -c shelly -f -n '__fish_seen_subcommand_from run; and __fish_seen_subcommand_from flatpak' -l list -s l -d 'List running Flatpak applications and process identifiers'
complete -c shelly -f -n '__fish_seen_subcommand_from run; and __fish_seen_subcommand_from appimage' -l kill -s k -d 'Stop the selected application instead of launching it'
