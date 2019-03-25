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
        source "${CURRENT_DIR}/default/config.sh"
        source "${CURRENT_DIR}/${PLATFORM}/config.sh"
        if [[ -e "${CURRENT_DIR}/local/config.sh" ]]; then
            source "${CURRENT_DIR}/local/config.sh"
        fi
        echo "${!1}";
    )
}

# PROMPT_DIRTRIM=2
PS1=$("${CURRENT_DIR}/set-ps-1.sh" \
        "$(get_config_value 'PS1_USER_COLOR')" \
        "$(get_config_value 'PS1_INCLUDE_HOST')" \
        )

for file in namespace.sh aliases.sh; do
    source "${CURRENT_DIR}/default/${file}"
    source "${CURRENT_DIR}/${PLATFORM}/${file}"
    if [[ -r "${CURRENT_DIR}/local/${file}" ]]; then
        source "${CURRENT_DIR}/local/${file}"
    fi
done

if [ "$(get_config_value 'SSH_AGENT_SETUP')" == "yes" ]; then
    source "${CURRENT_DIR}/ssh-agent-setup.sh" \
        "$(get_config_value 'SSH_AUTH_SOCK')" \
        "$(get_config_value 'SSH_AUTH_ENV')"
fi

unset CURRENT_DIR
unset -f get_platform
unset PLATFORM
unset -f get_config_value
