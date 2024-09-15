#!/bin/bash
restore() {
    local file_name="$1"
    local file_path="/home/vboxuser/RECYCLE_BIN/$file_name"
    if [ ! -e "$file_path" ]; then
        mv "$file_path" "$(dirname "$file_path")"
        echo "Error: '$file_name' does not exist in the recycle bin."
    else
        echo "Restored '$file_name' from recycle bin."
    fi
}
ls RECYCLE_BIN
read -p "Enter the name of the file or folder you want to restore from the recycle bin:" file
restore "$file"


