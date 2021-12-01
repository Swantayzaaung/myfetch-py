#!/usr/bin/bash

print_usage() {
  echo "Usage:"
  echo "-i --install    install the script"
  echo "-u --uninstall  uninstall the script"
  echo "-h --help       print this help list"
}

install() {
    if [[ ! -d /var/lib/myfetch ]] && [[ ! -f /usr/bin/myfetch ]]; then
        echo "Installing..."
        sudo mkdir /var/lib/myfetch
        sudo cp ./default.txt /var/lib/myfetch/default.txt
        sudo cp ./myfetch /usr/bin/myfetch
        echo "Installation complete!"
    else
        echo "myfetch is already installed"
    fi
}

uninstall() {
    if [[ -d /var/lib/myfetch ]] && [[ -f /usr/bin/myfetch ]]; then
        echo "Uninstalling..."
        sudo rm -rf /var/lib/myfetch
        sudo rm /usr/bin/myfetch
        echo "Uninstallation complete!"
    else
        echo "myfetch isn't installed"
    fi
}

while [ ! $# -eq 0 ]
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