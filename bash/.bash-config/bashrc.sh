#!/usr/bin/env bash

CURRENT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

get_platform() {
    local PLATFORM_FILE="${CURRENT_DIR}/platform"
    local DEFAULT_PLATFORM='desktop'

    if [[ ! -r "$PLATFORM_FILE" ]]; then
        echo -n "$DEFAULT_PLATFORM"
        return
    fi
    PLATFORM="$(cat "$PLATFORM_FILE")"
    if [[ ! -d "$PLATFORM" ]]; then
        echo -n "$DEFAULT_PLATFORM"
        return
    fi
    echo -n "$PLATFORM"
}

PLATFORM=`get_platform`

get_config_value() {
    (
        source "${CURRENT_DIR}/config.sh" "${PLATFORM}"
        if [[ -e "${CURRENT_DIR}/local-config.sh" ]]; then
            source "${CURRENT_DIR}/local-config.sh" "${PLATFORM}"
        fi
        echo "${!1}";
    )
}

# PROMPT_DIRTRIM=2
PS1=$("${CURRENT_DIR}/set-ps-1.sh" \
        "$(get_config_value 'PS1_USER_COLOR')" \
        "$(get_config_value 'PS1_INCLUDE_HOST')" \
        )

source "${CURRENT_DIR}/namespace.sh" "${PLATFORM}"

if [ "$(get_config_value 'SSH_AGENT_SETUP')" == "yes" ]; then
    source "${CURRENT_DIR}/ssh-agent-setup.sh" \
        "$(get_config_value 'SSH_AUTH_SOCK')" \
        "$(get_config_value 'SSH_AUTH_ENV')"
fi

if [[ -e "${CURRENT_DIR}/local-namespace.sh" ]]; then
    source "${CURRENT_DIR}/local-namespace.sh" "${PLATFORM}"
fi

unset CURRENT_DIR
unset -f get_platform
unset PLATFORM
unset -f get_config_value
