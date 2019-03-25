#!/usr/bin/env bash

PS1_INCLUDE_HOST="no"
PS1_USER_COLOR="LT_GREEN"

SSH_AGENT_SETUP="yes"
SSH_AUTH_SOCK="${HOME%/}/.ssh/ssh-agent.${USER}.sock"
SSH_AUTH_ENV="${SSH_AUTH_SOCK%.sock}.env"
