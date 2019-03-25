#!/usr/bin/env bash
# aliases, variables and functions

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls -lF'
alias ll='ls -F'
alias lh='ls -hlF'
alias la='ls -alF'
alias p='pwd'

export VISUAL="vim"
export EDITOR="${VISUAL}"

hisupt() { history -a; history -n; }

tchsh() {
    local _script="$1"

    if [[ -z "${_script}" ]]; then
        echo "Please, provide name to shell script."
        return 1
    fi

    _script="${_script%.sh}.sh"

    [[ -e "${_script}" ]] && { echo "File \"${_script}\" already exist."; return 0; }

    touch "${_script}" 1>/dev/null 2>&1 || { echo "Could not create \"${_script}\"."; return 3; }

    chmod u+rwx "${_script}" || { echo "Could not change permissions for \"${_script}\"."; return 4; }

    [[ -w "${_script}" ]] || { echo "File \"${_script}\" is not available for write."; return 5; }

    echo -e "#!/usr/bin/env bash\n\n\n" > "${_script}" 2>/dev/null || { echo "Could not write to file \"${_script}\"."; return 6; }

    return 0
}

vimsh() { local _out; _out="$(tchsh "$1")" && vim "${1%.sh}.sh" || echo "${_out}"; }

aptupdate() { sudo apt update; }

aptupgrade() { sudo apt upgrade; }

aptupdateupgrade() { sudo apt update && sudo apt upgrade; }

aptautoremove() { sudo apt autoremove; }

git config --global alias.co 'commit'
git config --global alias.st 'status'
git config --global alias.df 'diff'
git config --global alias.pu 'push'
git config --global core.editor "vim"
