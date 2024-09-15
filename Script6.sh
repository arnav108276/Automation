#!/bin/bash
read -p "Enter name of file" f
readarray -t forbidden_commands < "$f.txt"
check() {
    local command="$1"
    for forbidden_cmd in "${{forbidden_commands[@]}}"; do
        if [ "$forbidden_cmd" == "$command" ]; then
            echo "Execution of '$command' is forbidden!"
            return 1
        fi
    done
    return 0
}
while true; do
    read -p "Enter a command(0 to exit): " user_command
    if ! check "$user_command"; then
        continue
    fi
    eval "$user_command"
    if [ $user_command -eq 0 ]; then
    exit 1
    fi
done

