# Prompt user to confirm before execute dangerous operations
#confirm() {
#     local cmd="$*"
#
#     echo -e "Do you really want to \033[41;36m$cmd\033[0m \"$(hostname)\""
#     echo -n "input hostname for yes or other to exit: "
#
#     read -t 15 reply
#
#     if [ "$reply" = "$(hostname)" ]; then
#         "$@"
#     else
#         echo "Cancelled"
#     fi
#}

confirm() {
    local cmd="$*"

    echo -e "Do you really want to perform \e[01;31m$cmd\e[0m on \"$(hostname)\"?"
    echo -n "Input \"yes\" to confirm or other to exit: "

    read -t 15 reply

    if [ "X$reply" = "Xyes" ]; then
        "$@"
    else
        echo "Cancelled"
    fi
}

alias reboot="confirm reboot"
alias shutdown="confirm shutdown"
alias poweroff="confirm poweroff"
alias "rm"="confirm rm"
