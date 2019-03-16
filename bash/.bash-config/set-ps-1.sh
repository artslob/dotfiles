#!/usr/bin/env bash

# a     an ASCII bell character (07)
# d     the date  in  "Weekday  Month  Date"  format (e.g., "Tue May 26")
# e     an ASCII escape character (033)
# h     the hostname up to the first `.'
# H     the hostname
# j     the  number of jobs currently managed by the shell
# l     the basename of the shell's terminal  device name
# n     newline
# r     carriage return
# s     the  name  of  the shell, the basename of $0 (the portion following the final slash)
# t     the current time in 24-hour HH:MM:SS format
# T     the current time in 12-hour HH:MM:SS format
# @     the current time in 12-hour am/pm format
# u     the username of the current user
# v     the version of bash (e.g., 2.00)
# V     the release of bash,  version  +  patchlevel (e.g., 2.00.0)
# w     the current working directory
# W     the  basename  of the current working directory
# !     the history number of this command
# #     the command number of this command
# $     if the effective UID is 0, a #, otherwise  a $
# nnn   the  character  corresponding  to  the octal number nnn
# \     a backslash
# [     begin a sequence of non-printing characters (embed a terminal control sequence into the prompt)
# ]     end a sequence of non-printing characters

RS="\[\e[0m\]"                          # reset all
HC="\[\e[1m\]"    RS_HC="\[\e[21m\]"    # hicolor - makes color lighter (or bolder) (e.g. blue -> light blue)
DM="\[\e[2m\]"    RS_DM="\[\e[22m\]"    # dim text
IT="\[\e[3m\]"    RS_IT="\[\e[23m\]"    # italic text
UL="\[\e[4m\]"    RS_UL="\[\e[24m\]"    # underline
BL="\[\e[5m\]"    RS_BL="\[\e[25m\]"    # blinking text
IV="\[\e[7m\]"    RS_IV="\[\e[27m\]"    # inverse background and foreground
HD="\[\e[8m\]"    RS_HD="\[\e[28m\]"    # hidden text
ST="\[\e[9m\]"    RS_ST="\[\e[29m\]"    # strikethrough text

 BLACK="\[\e[30m\]";     LT_BLACK="\[\e[1;30m\]";     BG_BLACK="\[\e[40m\]";
   RED="\[\e[31m\]";       LT_RED="\[\e[1;31m\]";       BG_RED="\[\e[41m\]";
 GREEN="\[\e[32m\]";     LT_GREEN="\[\e[1;32m\]";     BG_GREEN="\[\e[42m\]";
YELLOW="\[\e[33m\]";    LT_YELLOW="\[\e[1;33m\]";    BG_YELLOW="\[\e[43m\]";
  BLUE="\[\e[34m\]";      LT_BLUE="\[\e[1;34m\]";      BG_BLUE="\[\e[44m\]";
PURPLE="\[\e[35m\]";    LT_PURPLE="\[\e[1;35m\]";    BG_PURPLE="\[\e[45m\]";
  CYAN="\[\e[36m\]";      LT_CYAN="\[\e[1;36m\]";      BG_CYAN="\[\e[46m\]";
 WHITE="\[\e[37m\]";     LT_WHITE="\[\e[1;37m\]";     BG_WHITE="\[\e[47m\]";

if [ "${1}" == "test" ]; then
    RS="${RS//\\[][]}"
    for attr in DM RS HC IV; do
        echo "${attr}"
        attr="${!attr}"
        attr="${attr//\\[][]}"
        for color in BLACK RED GREEN YELLOW BLUE PURPLE CYAN WHITE; do
            color="${!color}"
            color="${color//\\[][]}"
            echo -e "${attr}${color}test${RS}"
        done
        echo "----"
    done
    exit 0
fi


USER_COLOR="${!1}"
if [ -z "${USER_COLOR// }" ]; then
    USER_COLOR="${LT_GREEN}"
fi

case "${2}" in
    [Yy] | [Yy]es ) HOST="${RS}${USER_COLOR}@\h";;
    *)              HOST="";;
esac

TIME="${RS}${LT_YELLOW}[${LT_CYAN}\$(date +%H:%M:%S)${LT_YELLOW}]"

SPACE="${RS} "

CHROOT="${RS}${HC}${debian_chroot:+($debian_chroot)}"

USER="${RS}${USER_COLOR}\u"

SEMICOLON="${RS}:"

DIR_TRIM='$(p="${PWD/"${HOME}"/"~"}";((${#p}<=30)) && echo "\w" ||
{ p="${p:(-30)}"; p="$(echo "${p}" | sed -E "s#^[^/]*?/#/#")"; echo "...${p}"; })'

DIR="${RS}${LT_BLUE}${DIR_TRIM}"

DOLLAR="${RS} \\$ "

echo -n "${TIME}${SPACE}${CHROOT}${USER}${HOST}${SEMICOLON}${DIR}${DOLLAR}${RS}"
