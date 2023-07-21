
hostip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
wslip=$(hostname -I | awk '{print $1}')
port=7890
PROXY_HTTP="http://${hostip}:${port}"

set_proxy(){
    export http_proxy="${PROXY_HTTP}"
    export https_proxy="${PROXY_HTTP}"
    export ALL_PROXY="${PROXY_HTTP}"
}

unset_proxy(){
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset ALL_PROXY
}

alias cls='clear'
alias sproxy=set_proxy
alias uproxy=unset_proxy
