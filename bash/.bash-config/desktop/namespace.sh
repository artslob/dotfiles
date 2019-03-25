#!/usr/bin/env bash

alias yad='yandex-disk'
alias yadst='yandex-disk status'
alias connect_vps='ssh vps'  # should be entry 'vps' in ~/.ssh/config

restart_kde() { killall plasmashell && kstart plasmashell; }

browser-with-proxy() {
    ssh -f -N -D 7777 vps 2>&1 /dev/null && vivaldi --proxy-server="socks5://127.0.0.1:7777" &
}
