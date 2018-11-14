#!/bin/bash

default_gopath="$HOME/go"
goVersion="1.11.2"
goDir="go${goVersion}"

# Set working directory
echo 'moving to home directory'
cd
CWD="${HOME}"

# make ~/go directory
if [[ -d ${default_gopath} ]]; then
  echo -e "found \"${default_gopath}\""
else
  echo -e "did not find directory: \"${default_gopath}\", making directory"
  mkdir "${default_gopath}"
  mkdir "${default_gopath}/bin"
  mkdir "${default_gopath}/pkg"
  mkdir "${default_gopath}/src"
fi

# make ~/go<ver> directory
if [[ -d ${goDir} ]]; then
  echo -e "found \"${HOME}/${goDir}\""
else
  echo -e "did not find directory: \"${HOME}/${goDir}\", making directory"
  mkdir "${goDir}"

  # Set go directory full path
  goInstallPath="${CWD}/${goDir}"

  echo 'downloading go'
  curl --insecure --progress-bar "https://dl.google.com/go/${goDir}.linux-amd64.tar.gz" | tar -xz --directory "${goInstallPath}" --strip-components=1
fi

path_adjusted="false"
# TODO: add better checking
if [[ -z ${GOROOT+x} ]]; then
  echo 'GOROOT not set'
  echo 'setting GOROOT'
  echo "export GOROOT=\$HOME/${goDir}" >> ~/.bashrc
  echo 'add GOROOT to path'
  echo 'PATH=$PATH:$GOROOT/bin' >> ~/.bashrc
  path_adjusted="true"
else
  echo 'variable GOROOT already set'
fi

if [[ -z ${GOPATH+x} ]]; then
  echo 'GOPATH not set'
  echo 'setting GOPATH'
  echo "export GOPATH=${default_gopath}" >> ~/.bashrc
  echo 'add GOPATH to path'
  echo 'PATH=$PATH:$GOPATH' >> ~/.bashrc
  path_adjusted="true"
else
  echo 'variable GOPATH already set'
fi

if [[ "${path_adjusted}" == "true" ]]; then
  echo 'Please logout and back in to reset your env, or run the following: . ~/.bashrc'
fi

# check if go exist should produce...
# $ which go
# ~/go{ver}/bin/go
