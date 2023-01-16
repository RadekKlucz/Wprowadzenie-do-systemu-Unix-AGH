#!/bin/bash

trap 'echo "Caught signal $1"' 2
trap 'echo "Process has been killed"; exit' 15

echo "Press Ctrl+C or send SIGTERM to the script to trigger the trap."


while true; do
    :
    # pusta petla
done