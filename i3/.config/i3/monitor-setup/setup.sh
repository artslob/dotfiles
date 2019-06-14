#!/usr/bin/env bash

settings_folder="${HOME}/.config/i3/monitor-setup"
settings_file="${settings_folder}/layout"

settings="laptop-primary"

if [[ -r "$settings_file" ]]; then
    settings="$(cat $settings_file)"
fi

if [[ -x "${settings_folder}/${settings}.sh" ]]; then
    "${settings_folder}/${settings}.sh"
else
    "${settings_folder}/laptop-primary.sh"
fi
