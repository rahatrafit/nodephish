#!/bin/bash

# Check if Node.js is installed locally
if [ -f "./node/bin/node" ]; then
    echo "Starting server using local Node.js..."
    ./node/bin/node server.js
else
    echo "Node.js is not installed locally. Please run the installation script first."
fi
