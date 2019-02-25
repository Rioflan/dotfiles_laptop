#!/bin/sh

paths="bash_aliases bash_profile bashrc gitconfig vimrc xinitrc bash_logout bash_prompt viminfo Xauthority Xresources urxvt/ vim/ config/i3/ config/gtk-2.0/ config/gtk-3.0/"

function remove()
{
    rm "$1" -r
    [[ $1 =~ (.*)\/.+$ ]]
    tmp_dir="${BASH_REMATCH[1]}"
    while [ -z "$(ls $tmp_dir)" ]; do
        rmdir $tmp_dir
        [[ $tmp_dir =~ (.*)\/.+$ ]]
        tmp_dir="${BASH_REMATCH[1]}"
    done
}

for path in $paths
do
    if [[ $path =~ (.*)\/.+$ ]]; then
        tmp_path="${BASH_REMATCH[1]}"
        if ! [ -e "$tmp_path" ]; then
            mkdir $tmp_path -p
        fi
    fi
    if [ "$#" -eq 0 ]; then
        cp "$HOME/.$path" "$path" -r
    elif [ "$1" = "clean" ]; then
        remove $path
    elif [ "$1" = "print" ]; then
        echo "$path"
    fi
done
