#!/bin/bash

while true
do
    current_time=$(date +"%H:%M:%S")
    
    xsetroot -name "$current_time "
    
    sleep 1
done
