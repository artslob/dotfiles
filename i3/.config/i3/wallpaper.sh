#!/usr/bin/env bash

# make it a symbolic link to page
# e.g. ln -fs /path/to/image.png ~/.wallpaper
wp="${HOME}/.wallpaper"

# unless --no-fehbg option is passed, feh will create script to set the current background to ~/.fehbg
feh_script="${HOME}/.fehbg"

if [[ -x "$feh_script" ]]; then
    "$feh_script"
    exit 0
fi

if [[ -r "$wp" ]]; then
    feh --bg-max "$wp"
fi
