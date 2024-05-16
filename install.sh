#!/bin/bash

# Install Volk
cd
git clone --recursive https://github.com/gnuradio/volk.git
cd volk
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../
make
make test
sudo make install
sudo ldconfig

# Install GNU Radio
cd
git clone https://github.com/gnuradio/gnuradio.git
cd gnuradio
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../
make -j3
make test
sudo make install
sudo ldconfig

# Optionally increase performance by profiling Volk
# This step can take 10-15 minutes
# volk_profile

# Set environment variables for GNU Radio
echo 'export PYTHONPATH=/usr/local/lib/python3/dist-packages:/usr/local/lib/python2.7/site-packages:$PYTHONPATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export PYTHONPATH=/usr/local/lib/python3/dist-packages:/usr/local/lib/python2.7/site-packages:$PYTHONPATH' >> ~/.profile
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.profile

# If you've installed in a custom path with -DCMAKE_INSTALL_PREFIX=XXX,
# add that path to $PATH to find gnuradio-companion
# export PATH=/path/to/custom/prefix/bin:$PATH
