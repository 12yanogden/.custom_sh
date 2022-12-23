#!/bin/bash

clean() {
    local dir="$1"
    local date="$(date +%Y.%m.%d)"
    local files=($(find "$dir" | sed 's/^/"/g' | sed 's/$/"/g' | grep -v archive_*.tar.gz))

    echo ${files[@]}

    tar -cf "archive_$date.tar.gz" "${files[@]}" > /dev/null
}

clean "/Users/ryan/Downloads"