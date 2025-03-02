#!/bin/bash

# Function to install Node.js for the project
install_node_project_dependency() {
    echo "Installing project dependency..."
    echo "____________________________________________________________________"
    # credit 
    echo "author : Madara Uchiha"
    echo "version: 1.0.0"
    echo "Note: this project is built as educational purpose only, do not harm others, respect everyone's privacy - Madara"
    
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

    # Reload the bashrc to make the node path available
    if [ -n "$ZSH_VERSION" ]; then
        # For zsh (Termux default shell)
        source ~/.zshrc
    else
        # For bash (common in Termux and Linux)
        source ~/.bashrc
    fi

    # Verify installation (only in the current session)
    if command -v node &> /dev/null; then
        echo "Node.js installed locally."
    else
        echo "Node.js installation failed."
        exit 1
    fi
}

# Detect platform and architecture
PLATFORM=$(uname -s)

if [[ "$PLATFORM" == "Linux" ]]; then
    if [[ -f /data/data/com.termux/files/usr/bin/bash ]]; then
        # It's Termux, ensure that dependencies are installed
        if ! command -v curl &>/dev/null; then
            echo "curl is not installed. Installing curl..."
            pkg install curl
        fi
        if ! command -v tar &>/dev/null; then
            echo "tar is not installed. Installing tar..."
            pkg install tar
        fi
        install_node_project_dependency

    else
        # Check if it's Ubuntu/Debian or other Linux distribution
        if [[ -f /etc/os-release && $(grep -i "ubuntu" /etc/os-release) ]] || [[ -f /etc/os-release && $(grep -i "debian" /etc/os-release) ]]; then
            # Ubuntu/Debian-based system
            install_node_project_dependency
        else
            # Other Linux distribution (non-Ubuntu/Debian)
            # You might want to adjust for other package managers (e.g., yum, dnf, zypper)
            if command -v apt &>/dev/null; then
                sudo apt install curl tar
            elif command -v yum &>/dev/null; then
                sudo yum install curl tar
            elif command -v dnf &>/dev/null; then
                sudo dnf install curl tar
            fi
            install_node_project_dependency
        fi
    fi
else
    echo "Unsupported platform. Contact the author."
    exit 1
fi

# Inform the user that the dependencies are installed
echo "Dependencies installed successfully!"
