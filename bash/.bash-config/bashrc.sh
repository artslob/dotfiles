#!/usr/bin/env bash

CURRENT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

get_platform() {
    local PLATFORM_FILE="${CURRENT_DIR}/platform"
    local DEFAULT_PLATFORM='default'
    local LOCAL='local'

    echo "$DEFAULT_PLATFORM"

    if [[ ! -r "$PLATFORM_FILE" ]]; then
        echo "$LOCAL"
        return
    fi
    cat "$PLATFORM_FILE" | while read -r dir; do
        if [[    "$dir" != "$DEFAULT_PLATFORM"
              && "$dir" != "$LOCAL"
              && -d "${CURRENT_DIR}/${dir}" ]];
        then
            echo "$dir"
        fi
    done
    echo "$LOCAL"
}

PLATFORM=`get_platform`

get_config_value() {
    (
        for dir in $(echo $PLATFORM); do
            if [[ -e "${CURRENT_DIR}/${dir}/config.sh" ]]; then
                source "${CURRENT_DIR}/${dir}/config.sh"
            fi
        done
        echo "${!1}";
    )
}

PS1=$("${CURRENT_DIR}/set-ps-1.sh" \
        "$(get_config_value 'PS1_USER_COLOR')" \
        "$(get_config_value 'PS1_INCLUDE_HOST')" \
        )

for dir in $(echo $PLATFORM); do
    for file in namespace.sh aliases.sh; do
        if [[ -r "${CURRENT_DIR}/${dir}/${file}" ]]; then
            source "${CURRENT_DIR}/${dir}/${file}"
        fi
    done
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
unset dir
unset file
