function podreset --wraps='docker compose down & docker compose up -d' --description 'alias podreset=docker compose down & docker compose up -d'
    docker compose down & docker compose up -d $argv
end
