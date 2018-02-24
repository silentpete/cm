#!/bin/bash

# USAGE=

goVersion="1.10"
goDir="go${goVersion}"
echo 'moving to home directory'
cd
# Set current working directory
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# make go directory
if [[ -d ${goDir} ]]; then
  echo -e "found ${goDir}"
else
  echo -e "did not find dir ${goDir}, making dir"
  mkdir "${goDir}"
fi

# Set go directory full path
goInstallPath="${CWD}/${goDir}"

echo 'downloading go'
curl --insecure --progress-bar "https://dl.google.com/go/${goDir}.linux-amd64.tar.gz" | tar -xz --directory "${goInstallPath}" --strip-components=1

# TODO: add better checking
if [[ -z ${GOROOT+x} ]]; then
  echo 'GOROOT not set'
  echo 'setting GOROOT'
  echo "export GOROOT=\$HOME/${goDir}" >> ~/.bashrc
  echo 'add GOROOT to path'
  echo 'PATH=$PATH:$GOROOT/bin' >> ~/.bashrc
  echo 'Please logout and back in to reset your env, or run the following: . ~/.bashrc'
else
  echo 'variable GOROOT already set'
fi

# check if go exist should produce...
# $ which go
# ~/go{ver}/bin/go
