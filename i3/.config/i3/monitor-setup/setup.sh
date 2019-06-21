#!/usr/bin/env bash

scripts="${HOME}/.config/i3/monitor-setup"
layout_file="${scripts}/layout"

if [[ -r "$layout_file" ]]; then
    layout="$(cat $layout_file)"
else
    exit
fi

setup_script="${scripts}/${layout%.sh}.sh"

if [[ -x "$setup_script" ]]; then
    "$setup_script"
fi
