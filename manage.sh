#!/usr/bin/env bash

BASE_DIR="$(dirname "$(realpath "$BASH_SOURCE")")"

cat_prompter() {
    local prompt="$1"
    local color="$2"
    
    local line
    while IFS="" read -r line; do
        echo -ne "\033[${color}m"; echo -n "$prompt"; echo -ne "\033[0m"
        echo "$line"
    done
}

kill_and_wait() {
    local pid="$1"
    local signal="${2:-TERM}"
    local max_attempts="${3:-3}"
    local sleep_="${4:-0.5}"
    
    for attempt in $(seq "$max_attempts"); do
        if kill -"$signal" "$pid" 2> /dev/null; then
            sleep "$sleep_"
        else
            wait "$pid"
            return $?
        fi
    done
    
    kill -KILL "$pid" 2> /dev/null
    wait "$pid"
}

pushd "$BASE_DIR/stunnel" > /dev/null
stunnel config \
    > >(cat_prompter "[stunnel] " "1;36") \
    2> >(cat_prompter "[stunnel] " "1;35" >&2) &
stunnel_pid=$!
popd > /dev/null

python3 "$BASE_DIR/manage.py" "$@" \
    2> >(cat_prompter "[manage.py] " "1;31" >&2) &
manage_pid=$!

trap "
    kill_and_wait $stunnel_pid
    kill_and_wait $manage_pid
    exit \$?
" INT TERM

wait $stunnel_pid
wait $manage_pid
