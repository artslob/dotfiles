#!/usr/bin/env bash

wp="${HOME}/.wallpaper"

if [[ -r "$wp" ]]; then
    feh --bg-scale "$wp"
fi
