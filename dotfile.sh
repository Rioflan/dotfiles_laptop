#!/bin/sh

directory="$HOME/"
ignored=". bash_history cache esd_auth fehbg lesshst local mozilla pki python ssh thumbnails thunderbird"

for file in $(echo "$HOME/.*")
do
    var=$(echo $file | sed -E "s/${directory//\//\\/}\.(.*)/\1/")
    if [ -z "$var" ]; then
        continue 2
    fi
    is_ok="1"
    for i in $ignored
    do
        if [[ "$var" =~ "$i" ]]; then
            is_ok="0"
            break
        fi
    done
    if [ "$is_ok" = "1" ]
    then
        link="1"
        for arg in "$@"
        do
            if [ "$arg" = '-p' ]; then
                echo "$var"
            elif [ "$arg" = '-n' ]; then
                link="0"
            fi
        done
        if [ "$link" = "1" ]; then
            cp -r "$HOME/.$var" "./$var"
        fi
    fi
done
