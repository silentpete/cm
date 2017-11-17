#!/usr/bin/env bash

function info () {
  echo -e "\e[32m$1\e[0m"
}

function warn () {
  echo -e "\e[33m$1\e[0m"
}

function error () {
  echo -e "\e[31m$1\e[0m"
}

info "information"
warn "warning"
error "error"

