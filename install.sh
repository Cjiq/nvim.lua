#!/bin/bash

# Grap the current distro
# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    # Otherwise, use release info file
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
fi
DIST=$(echo $DISTRO | awk '{print $1}' | tr '[:upper:]' '[:lower:]')

echo -e "Installing neovim deps for $DIST"
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Install script not supported for $DIST"
elif [[ $DIST == "centos" ]]; then
		# sudo yum install -y     > /dev/null
  echo "Install script not supported for $DIST"
elif [[ $DIST == "Ubuntu" ]] || [[ "$DIST" == "debian" ]]; then
		# sudo apt-get install -y zsh > /dev/null
  echo "Install script not supported for $DIST"
elif [[ $DIST == "arch" ]]; then
		sudo pacman -S --noconfirm --needed tree-sitter luarocks ripgrep > /dev/null
else
	echo "Dist not supported. Aborting..."
	exit 1
fi
