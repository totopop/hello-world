#!/bin/bash

# Update package list and install build-essential for C++ compilation
sudo apt-get update
sudo apt-get install -y build-essential

# Install CMake
sudo apt-get install -y cmake

# Create build directory
mkdir -p build

echo "Environment setup complete. You can now build your project using CMake."