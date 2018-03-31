
autossh_fn() {
  usage() {
        cat <<EOF
cmmc autossh 0.0.1
    Usage: $0 $1 [install|config|uninstall|help]
EOF
  }
  case "$1" in
    config) unset host
        if [ "$(whoami)" != "root" ]; then
           echo "Script must be run as user: root"
           exit -1
        fi
        while [ -z ${host} ]; do
             read -e -r -p "Enter server host: " host
        done
        while :; do
            read -rp 'Enter server port(22001-22999): ' port
            [[ $port =~ ^[[:digit:]]+$ ]] || continue
            (port=(10#$port))
            (((port>=22001) &&(port<=22999))) || continue
            break
        done
        echo "server host = ${host}"
        echo "server port = ${port}"
        echo "${host}" > /boot/cmmc_ssh_host.txt
        echo "${port}" > /boot/cmmc_ssh_port.txt
    ;;
    start)
       echo "starting cmmc-autossh"
      /home/$USER/autossh-script/cmmc-autossh.sh
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
    uninstall)
      echo "enter uninstall"
      sudo rm -f /etc/cron.d/cmmc_autossh
    ;;
    *) usage "autossh";;
  esac

}
