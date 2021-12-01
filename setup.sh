#!/usr/bin/bash
install_script() {
    echo "Installing..."
    chmod +x ./myfetch
    if [[ -d /var/lib/myfetch ]]; then
        sudo rm -rf /var/lib/myfetch
        sudo mkdir /var/lib/myfetch
    else
        sudo mkdir /var/lib/myfetch
    fi
    sudo cp ./default.txt /var/lib/myfetch/default.txt
    sudo cp ./myfetch /usr/bin/myfetch
    echo "Installation complete!"
}

print_usage() {
  echo "Usage:"
  echo "-i --install    install the script"
  echo "-u --uninstall  uninstall the script"
  echo "-h --help       print this help list"
}

install() {
    if [[ -d /var/lib/myfetch ]] && [[ -f /usr/bin/myfetch ]]; then
        read -p "Myfetch is already installed. Do you wish to install again? [y/n] " -n 1 -r; echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit
        else
            install_script
        fi
    else
        install_script
    fi
}

uninstall() {
    if [[ -d /var/lib/myfetch ]] && [[ -f /usr/bin/myfetch ]]; then
        echo "Uninstalling..."
        sudo rm -rf /var/lib/myfetch
        sudo rm /usr/bin/myfetch
        echo "Uninstallation complete!"
    else
        echo "Myfetch isn't installed"
    fi
}

while [ $1 ]
do
	case "$1" in
		--help | -h)
			print_usage
			exit
			;;
        --install | -i)
            install
            exit
            ;;
        --uninstall | -u)
            uninstall
            exit
            ;;
        *)
            echo "Invalid option"
            print_usage
            exit 1
            ;;
	esac
	shift
done

echo "You need to give an option"
print_usage
exit 1
