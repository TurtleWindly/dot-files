#!/bin/bash

dir="$HOME/.config"
old_config_dir="$HOME/.config/old_config"

function all_setup {

    for program in `ls -I README.md -I *.sh -I old_config`; do
        if find $dir/$program -name "$program" -type d &> /dev/null; then
            mv $dir/$program $old_config_dir
            cp -r $program $dir
        else
            cp -r $program $dir
        fi
    done
}

function manual_setup {

    for program in `ls -I README.md -I *.sh -I old_config`; do
        local input=''
        while :
        do
            read -p "Do you want to use $program config ? (y/n): " input
            if [ -z $input ]; then
                echo "Invalid input"
            elif [ $input == "y" ]; then
                break
            elif [ $input == "n" ]; then
                break
            else
                echo "Invalid input"
            fi
        done

        if [ $input == "n" ]; then
            continue
        fi

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

if ! [ -z $1 ]; then
    if [ $1 == "new" ]; then
        echo "This is everything setup"
        echo "old config will be place at $old_config_dir"
        all_setup
    fi
else
    echo "This is Manual setup"
    manual_setup
fi

echo "Done!"
