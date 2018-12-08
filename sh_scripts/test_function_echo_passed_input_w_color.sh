#!/usr/bin/env bash

# OPTIONS
# DRYRUN
# Running with DRYRUN will not run the commands, but print them.
# VERBOSE
# Running with VERBOSE will add addition output you may want for debugging or extra verbage.

# info: pass in arguments and they will all print in green.
function info () {
  echo -e "\e[32mINFO: $@\e[0m"
}

# warn: pass in arguments and they will all print in yellow.
function warn () {
  echo -e "\e[33mWARN: $@\e[0m"
}

# error: pass in arguments and they will all print in red, then the script will exit 1.
function error () {
  echo -e "\e[31mERROR: $@\e[0m"
  exit 1
}

# Example Use
[[ $VERBOSE ]] && echo 'use the info function to print out something in green'
${DRYRUN:+echo} info "information"
[[ $VERBOSE ]] && echo 'use the warn function to print out something in yellow'
${DRYRUN:+echo} warn "warning"
[[ $VERBOSE ]] && echo 'use the error function to print out something in red, and exit 1'
${DRYRUN:+echo} error "error"

