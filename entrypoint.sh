#!/bin/sh
set -e

steps() {
    echo "use Regexp::Debugger save_to => \"regex.json\";" > steps.pl
    echo "\$_ = \"${2}\"; /${1}/;" >> steps.pl
    echo -e "\e[93mString :\e[39m ${2}"
    echo -e "\e[93mPattern:\e[39m ${1}"
    echo -e "Regex analysis in progress..."
    perl steps.pl 2>/dev/null
    res=`cat regex.json | jq '[.match_data[].event][-1].msg'`
    echo -e "\e[92m${res//\"}\e[39m"
}

json() {
    echo "use Regexp::Debugger save_to => \"regex.json\";" > steps.pl
    echo "\$_ = \"${2}\"; /${1}/;" >> steps.pl
    echo -e "\e[93mString :\e[39m ${2}"
    echo -e "\e[93mPattern:\e[39m ${1}"
    echo -e "Regex analysis in progress..."
    perl steps.pl 2>/dev/null
    cat regex.json | jq '[.match_data[]]'
}

if [ "$1" = 'sh' -o  "$1" = 'shell' -o "$1" = 'bash' ]; then
    exec sh
elif [ "$1" = 'version' ]; then
    echo -e "\e[92mversion ${VERSION}\e[39m"
elif [ "$1" = 'steps' ]; then
    shift
    steps $@
elif [ "$1" = 'json' ]; then
    shift
    json $@
elif [ "$1" = 'help' ]; then
    echo -e "\e[92mversion ${VERSION}\e[39m"
    echo -e "\e[93mUsage:\e[39m"
    echo -e "    \e[97mdocker run --rm -it andreburgaud/regexdebug sh\e[39m      : starts a shell"
    echo -e "    \e[97mdocker run --rm -it andreburgaud/regexdebug steps <pattern> <string>\e[39m : displays number of steps"
    echo -e "    \e[97mdocker run --rm -it andreburgaud/regexdebug json  <pattern> <string>\e[39m : displays all the steps in json format"
    echo -e "    \e[97mdocker run --rm -it andreburgaud/regexdebug\e[39m         : starts the interactive debugger"
    echo -e "    \e[97mdocker run --rm -it andreburgaud/regexdebug help\e[39m    : displays this help"
    echo -e "    \e[97mdocker run --rm -it andreburgaud/regexdebug version\e[39m : displays version"
else
    exec rxrx
fi