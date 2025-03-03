#!/bin/bash


    
    echo "Installing project dependency..."
    echo "_____________________________________________________________"
    # credit 
    echo "author : Madara Uchiha"
    echo "Beta tester : Mahafuzur Rahman(mama)"
    echo "version: 1.0.0"
    echo "Note: this project is built as educational purpose only, do not harm others, respect everyone's privacy - Madara"
    


    # Update package list and upgrade installed packages
    echo "Updating packages..."
    pkg update -y && pkg upgrade -y
    
    # Install Node.js and npm
    echo "Installing ..."
    pkg install -y nodejs
    
    # Verify installation
    echo "Checking version..."
    node -v
    
    echo "Checking npm version..."
    npm -v
    
    echo "installation completed!"
