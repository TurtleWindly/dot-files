#!/bin/bash

dir="$HOME/.config"
old_config_dir="$HOME/.config/old_config"

function all_setup {
    for program in `ls -d */`; do
        if find $dir/$program -name "$program" -type d &> /dev/null; then
            mv $dir/$program $old_config_dir
            cp -r $program $dir
        else
            cp -r $program $dir
        fi
    done
}

if ! find $old_config_dir &> /dev/null; then
    mkdir -p $old_config_dir
else
    rm -r $old_config_dir
fi

all_setup

echo "Done!"
