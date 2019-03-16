#!/usr/bin/env bash

PS1_INCLUDE_HOST="no"

SSH_AGENT_SETUP="yes"
SSH_AUTH_SOCK="${HOME%/}/.ssh/ssh-agent.${USER}.sock"
SSH_AUTH_ENV="${SSH_AUTH_SOCK%.sock}.env"

case "$1" in
    desktop)
        PS1_USER_COLOR="LT_GREEN"
        ;;
    vps)
        PS1_USER_COLOR="LT_RED"
        ;;
    *)
        PS1_USER_COLOR="LT_GREEN"
        ;;
esac
