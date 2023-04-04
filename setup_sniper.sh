#!/bin/bash

# Install necessary packages
sudo apt-get update
sudo apt-get install -y build-essential zlib1g-dev libbz2-dev libboost-dev libsqlite3-dev gfortran m4 python2 git mpich gedit gcc-9 g++-9

# Set environment variables
export SNIPER_ROOT=$(pwd)
export BENCHMARKS_ROOT=$SNIPER_ROOT/benchmarks

# Add environment variables to ~/.bashrc so they persist across shell sessions
echo "export SNIPER_ROOT=$SNIPER_ROOT" >> ~/.bashrc
echo "export BENCHMARKS_ROOT=$BENCHMARKS_ROOT" >> ~/.bashrc

# Go to the benchmarks directory and run make
cd $BENCHMARKS_ROOT
make

