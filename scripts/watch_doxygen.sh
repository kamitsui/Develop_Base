#!/bin/bash

live-server html --port=8080 --host=0.0.0.0 &
while inotifywait -e modify,create,delete -r ./srcs ./docs; do
	doxygen Doxyfile
	sleep 2
done
