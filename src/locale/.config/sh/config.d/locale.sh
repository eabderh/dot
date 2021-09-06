export LC_CTYPE=C
export LC_ALL=en_US.UTF-8
export LC_LANG="$LC_ALL"
export LC_ADDRESS="$LC_ALL"
export LC_NAME="$LC_ALL"
export LC_MONETARY="$LC_ALL"
export LC_PAPER="$LC_ALL"
export LC_IDENTIFICATION="$LC_ALL"
export LC_TELEPHONE="$LC_ALL"
export LC_MEASUREMENT="$LC_ALL"
export LC_NUMERIC="$LC_ALL"

export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# only define if $TZ is undefined
if [ -z $TZ ]; then
   export TZ="/usr/share/zoneinfo/Europe/Zurich"
fi


