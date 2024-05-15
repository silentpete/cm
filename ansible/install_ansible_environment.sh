#!/bin/bash

echo 'init.sh: will exit when any command fails'
set -e

echo 'Get the OS Distribution from /etc/os-release'
export DISTRO=$(awk -F= '/^ID=/{print $2}' /etc/os-release | tr -d '"')

# ${VAR,,} == lowercase
echo 'set package manager, so we can work with Rocky or Ubuntu'
case ${DISTRO,,} in
  "rocky")
    PACKAGE_MANAGER="dnf";
    ;;
  "ubuntu")
    PACKAGE_MANAGER="DEBIAN_FRONTEND=noninteractive apt";
    sudo ${PACKAGE_MANAGER} update;
    ;;
  *) echo "could not match OS, exiting"; exit 1;;
esac

echo 'ensure python3 and setuptools packages are installed'  # EL9 python3 points to python3.9
sudo ${PACKAGE_MANAGER} install -y python3 python3-setuptools

echo 'check for latest versions of python packages'
if [[ "${PACKAGE_MANAGER}" == "dnf" ]]; then
  sudo ${PACKAGE_MANAGER} update -y python3 python3-setuptools
fi

echo 'install python3-pip package'  # EL9 python3 package does not automatically install pip
sudo ${PACKAGE_MANAGER} install -y python3-pip

# https://peps.python.org/pep-0668/
# To be able to install packages to the system, and not venv, we can use the environment variable (PIP_BREAK_SYSTEM_PACKAGES) to bypass enforcement.
echo 'ensure python3 pip module is latest'
sudo PIP_BREAK_SYSTEM_PACKAGES=1 python3 -m pip install --upgrade pip

echo 'install python3 pip module ansible'
sudo PIP_BREAK_SYSTEM_PACKAGES=1 python3 -m pip install --upgrade ansible
