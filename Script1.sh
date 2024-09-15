#!/bin/bash
tar -cvf new_archive.tar.gz $(find . -type f -name "*.log")
if [-e "backup"]; then
mv new_archive.tar.gz backup
else
mkdir backup
mv new_archive.tar.gz backup
fi

echo "Script1 executed"

