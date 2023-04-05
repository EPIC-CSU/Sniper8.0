#!/bin/bash

# Install necessary packages
sudo apt-get update
sudo apt-get install -y build-essential zlib1g-dev libbz2-dev libboost-dev libsqlite3-dev gfortran m4 python2 git mpich gedit gcc-9 g++-9

# Configure the GCC and G++ version 9 compilers for compiling Sniper and the benchmarks
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 50 --slave /usr/bin/g++ g++ /usr/bin/g++-11

# Install Intel Pin
tar -xvf pin-3.22-98547-g7a303a835-gcc-linux.tar.gz
ln -s pin-3.22-98547-g7a303a835-gcc-linux pin_kit

# Set environment variables
export SNIPER_ROOT=$(pwd)
export BENCHMARKS_ROOT=$SNIPER_ROOT/benchmarks

# Add environment variables to ~/.bashrc so they persist across shell sessions
echo "export SNIPER_ROOT=$SNIPER_ROOT" >> ~/.bashrc
echo "export BENCHMARKS_ROOT=$BENCHMARKS_ROOT" >> ~/.bashrc

# Go to the benchmarks directory and run make
cd $BENCHMARKS_ROOT
make

# Run test
./run-sniper -p splash2-radix -i small -n 4 -c small
