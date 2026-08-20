function omp --description "Launch omp in bash" --wraps=omp
    env SHELL=/bin/bash BASH_ENV=$HOME/dotfiles/bash/env.sh bash -c 'omp "$@"' -- $argv
end
