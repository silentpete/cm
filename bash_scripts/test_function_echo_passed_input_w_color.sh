#!/usr/bin/env bash

function info () {
  echo -e "\e[32mINFO:\e[0m $1"
}

function warn () {
  echo -e "\e[33mWARN:\e[0m $1"
}

function error () {
  echo -e "\e[31mERROR:\e[0m $1"
}

info "information"
warn "warning"
error "error"

