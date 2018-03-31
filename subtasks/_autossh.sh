
autossh_fn() {
  usage() {
        cat <<EOF
cmmc autossh 0.0.1
    Usage: $0 $1 [install|config|uninstall|help]
EOF
  }
  case "$1" in
    config) unset host
        while [ -z ${host} ]; do
             read -e -r -p "Enter server host: " host
        done
        while :; do
            read -rp 'Enter server port(2000-8000): ' port
            [[ $port =~ ^[[:digit:]]+$ ]] || continue
            (port=(10#$port))
            (((port<=8000) && (port>=2000))) || continue
            break
        done 
        echo "server host = ${host}"
        echo "server port = ${port}" 
        sudo echo "${host}" > /boot/cmmc_ssh_host.txt
        sudo echo "${port}" > /boot/cmmc_ssh_port.txt
    ;;
    check) 
        echo "loading configurations"
        host=`cat /boot/cmmc_ssh_host.txt`
        port=`cat /boot/cmmc_ssh_port.txt`
        echo "server host = ${host}"
        echo "server port = ${port}" 
    ;;
    install) 
      echo "installing crontab.d"
      sudo cp -Rvf /home/$USER/autossh-script/cron.d/cmmc_autossh /etc/cron.d/cmmc_autossh 
    ;;
    uninstall) echo "enter uninstall";;
    *) usage "autossh";;
  esac

}
