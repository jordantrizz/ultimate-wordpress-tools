#!/usr/bin/env bash
# Bash Scripting Boiler Plate
# -- Parse Command Line Arguments https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

help () {
        echo "Usage: wp-cli-update-array-option.sh <option-name> <option-key> <value>"
        exit
}

option_name=$1
option_key=$2
option_value=$3

if [ -z "$option_name" ]; then help; fi
if [ -z "$option_key" ]; then help; fi
if [ -z "$option_value" ]; then help; fi

wp option get ${option_name} --format=json | php -r "
\$option = json_decode( fgets(STDIN) );
\$option->${option_key} = \"${option_value}\";
print json_encode(\$option);
" | wp option set ${option_name} --format=json