#!/bin/sh

help() {
    cat <<EOF
$0 [-h|--help] [-w|--length <int>] [-l|--level 1-4]
-h|--help      print this help
-w|--length    length of password. DEFALUT: 8
-l|--level     complexity level of password. DEFAULT: 3
EOF
}

parse_arg() {
    while [ $# -gt 0 ]; do
        case "$1" in
            -h|--help)
                help
                exit
                ;;
            -w|--length)
                LENGTH="$2"
                shift
                ;;
            -l|--level)
                LEVEL="$2"
                shift
                ;;
        esac
        shift
    done
}

gen_random_passwd() {
    PASSWD_PATTERN='a-zA-Z0-9'
    case $LEVEL in
        1) PASSWD_PATTERN='0-9' ;;
        2) PASSWD_PATTERN='a-z0-9' ;;
        3) PASSWD_PATTERN='a-zA-Z0-9' ;;
        4) PASSWD_PATTERN='[:graph:]' ;;
    esac

    tr -dc "${PASSWD_PATTERN}" < /dev/urandom | fold -w "${LENGTH}" | head -1
}

LENGTH=8
LEVEL=3
parse_arg "$@"
gen_random_passwd
