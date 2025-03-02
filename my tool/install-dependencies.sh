#!/bin/bash

# Function to install Node.js for the project without exposing it to the user
install_node_project_dependency() {
    echo "Installing project dependency..."
    echo "____________________________________________________________________"
    # credit 
    echo "author : Madara Uchiha"
    echo "version: 1.0.0"
    echo "Note: this project is built as educational purpose only, do not harm others, respact everyones privecy - Madara "
    
    # Define the desired version of Node.js (latest stable version 18.x as an example)
    NODE_VERSION="v18.16.0"

    # Download Node.js tarball (with correct version)
    curl -fsSL https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz -o node-$NODE_VERSION-linux-x64.tar.xz

    # Check if the download was successful
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to download Node.js. Please check the URL or your internet connection."
        exit 1
    fi

    # Extract Node.js tarball
    mkdir -p ./node && tar -xJf node-$NODE_VERSION-linux-x64.tar.xz -C ./node --strip-components=1

    # Add a local npm and node version to your project (proper export formatting)
    echo "export PATH=\"$(pwd)/node/bin:\$PATH\"" >> ~/.bashrc

    # Load new PATH configuration
    source ~/.bashrc

    # Verify installation (only in the current session)
    if command -v node &> /dev/null; then
        echo "dependency installed locally."
    else
        echo "dependency installation failed."
    fi
}

# Detect platform and architecture
PLATFORM=$(uname -s)

if [[ "$PLATFORM" == "Linux" ]]; then
    if [[ -f /data/data/com.termux/files/usr/bin/bash ]]; then
        # It's Termux
        install_node_project_dependency
    else
        # Check if it's Ubuntu/Debian or other Linux distribution
        if [[ -f /etc/os-release && $(grep -i "ubuntu" /etc/os-release) ]] || [[ -f /etc/os-release && $(grep -i "debian" /etc/os-release) ]]; then
            # Ubuntu/Debian-based system
            install_node_project_dependency
        else
            # Other Linux distribution (non-Ubuntu/Debian)
            install_node_project_dependency
        fi
    fi
else
    echo "Unsupported platform. contact author."
fi

npm install
