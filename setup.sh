#!/bin/bash

dir="$HOME/.config"
old_config_dir="$HOME/.config/old_config"
FONT_DIR="$HOME/.local/share/fonts"

function install_fonts {
	if [[ -d "$FONT_DIR" ]]; then
		cp -rf ./.fonts/* "$FONT_DIR"
	else
		mkdir -p "$FONT_DIR"
		cp -rf ./.fonts/* "$FONT_DIR"
	fi
}

function all_setup {
    install_fonts
    for program in `ls -d */`; do
        if find $dir/$program -name "$program" -type d &> /dev/null; then
            mv $dir/$program $old_config_dir
            cp -r $program $dir
        else
            cp -r $program $dir
        fi
    done
}

function manual_setup {

    install_fonts
    for program in `ls -d */`; do
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
