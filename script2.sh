#!/bin/bash
tar -cvf new_archive1.tar.gz $(find / -name *.tar -mtime -2)
if [rm -f new_archive1.tar]; then
echo "Archive deleted"
fi
echo "Script2 executed"

