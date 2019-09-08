#!/usr/bin/env bash

# make it a symbolic link to page
# e.g. ln -fs /path/to/image.png ~/.wallpaper
wp="${HOME}/.wallpaper"

if [[ -r "$wp" ]]; then
    feh --bg-max "$wp"
fi
