#!/usr/bin/env bash

restart_kde() { killall plasmashell && kstart plasmashell; }

browser-with-proxy() {
    ssh -f -N -D 7777 vps 2>&1 /dev/null && vivaldi --proxy-server="socks5://127.0.0.1:7777" &
}
