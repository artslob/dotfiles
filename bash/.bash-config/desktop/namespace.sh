#!/usr/bin/env bash

export PATH="${PATH}:/usr/local/go/bin"
export GOPATH="${HOME}/go"

restart_kde() { killall plasmashell && kstart plasmashell; }

vivaldi-with-proxy() {
    ssh -f -N -D 7777 vps > /dev/null 2>&1 && vivaldi --proxy-server="socks5://127.0.0.1:7777" --password-store=kwallet &
}

touchpad_disable() { xinput disable "ETPS/2 Elantech Touchpad"; }

touchpad_enable() { xinput enable "ETPS/2 Elantech Touchpad"; }
