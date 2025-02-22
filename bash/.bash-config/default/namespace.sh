#!/usr/bin/env bash
# aliases, variables and functions

export VISUAL="vim"
export EDITOR="${VISUAL}"

# PROMPT_DIRTRIM=2

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

if [ -r "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

export PATH="$HOME/bin:$PATH"

if command -v starship 1>/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

if [ -r ~/.bash_completions/alacritty ]; then
    source ~/.bash_completions/alacritty
fi

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

aptupdate() { sudo apt update && apt list --upgradable; }

aptupgrade() { sudo apt upgrade; }

aptupdateupgrade() { aptupdate && sudo apt upgrade; }

aptautoremove() { sudo apt autoremove; }
