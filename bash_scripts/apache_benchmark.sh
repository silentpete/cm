#!/usr/bin/env bash

ADDRESS=""
NUM_OF_REQUESTS=""
NUM_OF_REQUESTS_AT_A_TIME=""

echo "How many requests would you like to send?"
read NUM_OF_REQUESTS

echo "How many requests at a time?"
read NUM_OF_REQUESTS_AT_A_TIME

echo "What address would you like to benchmark?"
read ADDRESS

ab -n ${NUM_OF_REQUESTS} -c ${NUM_OF_REQUESTS_AT_A_TIME} ${ADDRESS}

echo "script complete"
