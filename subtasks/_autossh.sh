
autossh_fn() {
  usage() {
        cat <<EOF
cmmc autossh 0.0.1
    Usage: $0 $1 [install|config|uninstall|help]
EOF
  }
  case "$1" in
    config) 
        unset host
        while [ -z ${host} ]; do
             read -e -r -p "Enter server host: " host
        done
        while :; do
            read -rp 'Enter server port(2000-8000): ' number
            [[ $number =~ ^[[:digit:]]+$ ]] || continue
            (number=(10#$number))
            (( (number<=8000) && number>=2000)) || continue
            break
        done 
        echo "server host = ${host}"
        echo "server port = ${number}" 
    ;;
    install) echo "enter install";;
    uninstall) echo "enter uninstall";;
    *) usage "autossh";;
  esac

}
