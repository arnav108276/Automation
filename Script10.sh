#!/bin/bash
DIRECTORY="/tmp"
LOG_FILE="/var/log/delete_log.txt"
ARCHIVE_DIR="/var/log/deleted_files"

check_deleted_files() {
    # Find deleted files in the directory
    deleted_files=$(find "$DIRECTORY" -type f -printf "%T@ %p\n" 2>/dev/null | grep "^0" | cut -d' ' -f2-)
    if [ -n "$deleted_files" ]; then
        # Archive each deleted file
        for file in $deleted_files; do
            tar -cvf "$ARCHIVE_DIR/deleted_files_$(date +"%Y%m%d%H%M%S").tar" "$file"
            echo "$(date +"%Y-%m-%d %T") - File deleted: $file" >> "$LOG_FILE"
        done
    fi
}
check_deleted_files()
cat "$LOG_FILE"


