#!/usr/bin/env bash

_config_vpn_completion() {
    local cur prev opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="connect disconnect reroute -h --help"

    # Sets completion for main options (connect, disconnect)
    if [[ ${COMP_CWORD} -eq 1 ]]; then
    # If it's the first potential option, then complete with connect or disconnect
        mapfile -t COMPREPLY < <(compgen -W "$opts" -- "$cur")
        return 0
    fi

    # Set completion options if help flag is passed
    if [[ $prev == "-h" || $prev == "--help" ]]; then
    # return empty array, completion not needed after -h or --help is typed
        COMPREPLY=()
        return 0
    fi
}

complete -F _config_vpn_completion config-vpn
