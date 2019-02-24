#!/bin/bash

# This bash script is used to backup a user's Projects directory to /tmp

user=$(whoami)

if [ -z $1 ]; then
    echo "Provide directory please"
    exit 1
else
    # how to put "~/Projects/$1" correctly here?
    if [ ! -d "$1" ]; then
        echo "Required $1 directory doesn't exist"
        exit 1
    else
        input=$1
        # how to regexp project folder name?
        output=/tmp/${user}_Project_$(date +%Y-%m-%d_%H%M%S).tar.gz
    fi
    
fi

function total_files {
    find $1 -type f | wc -l
}

function total_directories {
    find $1 -type d | wc -l
}

function total_archived_directories {
    tar -tzf $1 | grep  /$ | wc -l
}

function total_archived_files {
    tar -tzf $1 | grep -v /$ | wc -l
}

tar -czf $output $input 2> /dev/null

src_files=$( total_files $input )
src_directories=$( total_directories $input )

arch_files=$( total_archived_files $output )
arch_directories=$( total_archived_directories $output )

echo "Files to be included: $src_files"
echo "Directories to be included: $src_directories"
echo "Files archived: $arch_files"
echo "Directories archived: $arch_directories"

if [ $src_files -eq $arch_files ]; then
    echo "Backup of $input completed!"
    echo "Details about the output backup file:"
    ls -l $output
else
    echo "Backup of $input failed!"
fi