#!/usr/bin/env bash

scripts="${HOME}/.config/i3/monitor-setup"
layout_file="${scripts}/layout"

if [[ -r "$layout_file" ]]; then
    layout="$(cat $layout_file)"
else
    exit
fi

if [[ -x "${scripts}/${layout}.sh" ]]; then
    "${scripts}/${layout}.sh"
fi
