#!/bin/sh

while [ 1 -gt 0 ]; do 
	echo "Gatsby develop starting" | logger

	timeout 10m gatsby develop --port 3000 --host 0.0.0.0
	
	echo "Gatsby develop gracefully timedout" | logger
	
	sleep 3
done
