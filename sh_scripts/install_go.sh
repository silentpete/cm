#!/bin/bash

# VERBOSE
# Running with VERBOSE will add addition output you may want for debugging or extra verbage.

# debug: pass in arguments and they will all print in green.
function debug () {
  echo -e "\e[36mtime=\"$(date --rfc-3339='seconds')\" level=DEBUG msg=\"$@\"\e[0m"
}

# info: pass in arguments and they will all print in green.
function info () {
  echo -e "\e[32mtime=\"$(date --rfc-3339='seconds')\" level=INFO msg=\"$@\"\e[0m"
}

# warn: pass in arguments and they will all print in yellow.
function warn () {
  echo -e "\e[33mtime=\"$(date --rfc-3339='seconds')\" level=WARN msg=\"$@\"\e[0m"
}

# error: pass in arguments and they will all print in red, then the script will exit 1.
function error () {
  echo -e "\e[31mtime=\"$(date --rfc-3339='seconds')\" level=ERROR msg=\"$@\"\e[0m"
  exit 1
}

default_gopath="$HOME/gocode"
goVersion="1.12"
goDir="go${goVersion}"

# Set working directory
[[ $VERBOSE ]] && debug 'moving to home directory'
cd
CWD="${HOME}"

if [[ -d ${default_gopath} ]]; then
  [[ $VERBOSE ]] && debug "found \"${default_gopath}\""
else
  info "Setup my Go coding directory"
  [[ $VERBOSE ]] && debug "did not find directory: \"${default_gopath}\", making directory"
  mkdir "${default_gopath}"
  mkdir "${default_gopath}/bin"
  mkdir "${default_gopath}/pkg"
  mkdir "${default_gopath}/src"
  mkdir "${default_gopath}/src/github.com"
  mkdir "${default_gopath}/src/github.com/silentpete"
fi

if [[ -d ${goDir} ]]; then
  [[ $VERBOSE ]] && debug "found \"${HOME}/${goDir}\""
else
  info "Create ~/go<ver> directory"
  [[ $VERBOSE ]] && debug "did not find directory: \"${HOME}/${goDir}\", making directory"
  mkdir "${goDir}"

  info "Set go directory full path"
  goInstallPath="${CWD}/${goDir}"

  info 'downloading Go tar.gz'
  curl --insecure --progress-bar "https://dl.google.com/go/${goDir}.linux-amd64.tar.gz" | tar -xz --directory "${goInstallPath}" --strip-components=1
fi

path_adjusted="false"
# TODO: add better checking
if [[ -z ${GOROOT+x} ]]; then
  info "Set GOROOT"
  [[ $VERBOSE ]] && debug 'GOROOT not set, setting GOROOT'
  echo "export GOROOT=\$HOME/${goDir}" >> ~/.bashrc
  [[ $VERBOSE ]] && debug 'add GOROOT to path'
  echo 'export PATH=$PATH:$GOROOT/bin' >> ~/.bashrc
  path_adjusted="true"
else
  [[ $VERBOSE ]] && debug 'variable GOROOT already set'
fi

if [[ -z ${GOPATH+x} ]]; then
  info "Set GOPATH"
  [[ $VERBOSE ]] && debug 'GOPATH not set, setting GOPATH'
  echo "export GOPATH=${default_gopath}" >> ~/.bashrc
  [[ $VERBOSE ]] && debug 'add GOPATH to path'
  echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
  path_adjusted="true"
else
  [[ $VERBOSE ]] && debug 'variable GOPATH already set'
fi

if [[ "${path_adjusted}" == "true" ]]; then
  info 'Please logout and back in to reset your env, or run the following: . ~/.bashrc'
fi

# check if go exist should produce...
# $ which go
# ~/go{ver}/bin/go
