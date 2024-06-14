#!/usr/bin/env bash

#complete -W "connect disconnect" config-vpn

_config-vpn_completion()
	{
		readarray -t COMPREPLY < <(compgen -W "connect disconnect" "${COMP_WORDS[1]}")
	}

complete -F _config-vpn_completion config-vpn
