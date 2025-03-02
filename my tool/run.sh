#!/bin/bash

# Check if Node.js is installed locally (inside the project directory)
if [ -f "./node/bin/node" ]; then
    echo "Starting server using local Node.js..."
    ./node/bin/node server.js
else
    echo "Node.js is not installed locally. Please run the dependency installation script first."
    exit 1
fi
