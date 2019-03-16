#!/usr/bin/env bash

# $1 - is SSH_AUTH_SOCK
# $2 - is SSH_AUTH_ENV

init-ssh-agent-env() {
    local _sock="${1}"
    local _env="${2}"

    # populate global env to use this var in other functions from this file
    SSH_AUTH_ENV="${_env}"

    if [ -S "${SSH_AUTH_SOCK}" ]; then
        # means system already provides ssh agent
        # maybe check SSH_AGENT_PID here too
        return
    fi

    # we want this var always be set
    SSH_AUTH_SOCK="${_sock}"

    if [ ! -r "${_env}" -o ! -e "${_sock}" ]; then
        # ssh-agent not started yet *OR* env file exist but not socket
        return
    fi

    if [ ! -S "${_sock}" ]; then
        echo "warning! this path reserved for ssh-agent socket: ${_sock}"
        return
    fi

    # user already started ssh-agent; update global env
    source "${_env}"
}

init-ssh-agent-env "${1}" "${2}"

startagent() {
    local _sock="${SSH_AUTH_SOCK}"
    local _env="${SSH_AUTH_ENV}"

    if [ -e "${_sock}" ]; then
        if [ -S "${_sock}" ]; then
            echo "ssh-agent already running! sock: ${_sock}, pid: ${SSH_AGENT_PID}"
        else
            echo "cant start ssh-agent, path already exist and not socket: ${_sock}"
        fi
        return 1
    fi

    ssh-agent -a "${_sock}" | egrep -v '^echo' > "${_env}"
    chmod 600 "${_env}"
    source "${_env}"
    echo "ssh-agent started. sock: ${_sock}, pid: ${SSH_AGENT_PID}"
}

stopagent() {
    eval "$(ssh-agent -k)" || echo "error while stopping ssh-agent"
}
