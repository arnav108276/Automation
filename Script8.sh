#!/bin/bash
if [ ! -e "$RECYCLE_BIN" ]; then
    mkdir "$RECYCLE_BIN"
fi
move_to_recycle_bin() {
    local file_name="$1"
    if [ -e "$file_name" ]; then
        mv -f "$file_name" "$RECYCLE_BIN"
        echo "Moved '$file_name' to recycle bin."
    else
        echo "Error: '$file_name' does not exist."
    fi
}
while true; do
    read -p "Enter the file you want to delete (or 'exit' to quit):" file
    if [ "$file" = "exit" ]; then
        echo "Exiting the script."
        exit 0
    fi
    read -p "Are you sure you want to move '$file' to the recycle bin? (y/n)" con
    if [ "$con" = "y" ]; then
        move_to_recycle_bin "$file"
    elif [ "$con" = "n" ]; then
        echo "Deletion canceled."
    else
        echo "Invalid input. Deletion canceled."
    fi
done

