#!/bin/bash

# John Hammond
# 21 August 2019

# The reason that the autogenerated documentation would not include
# the docstrings and in-code comments for our files was because it would
# pull them from the INSTALLED MODULE of Katana... not the scripts in the 
# codebase. So, to see the proper changes, we need to on-the-fly
# remove the Katan module, rebuild it, and THEN generate the documentation.

# Remove Katana temporarily
yes | pip3 uninstall katana

# Move back up to get Katana's source root
pushd .
cd ..

# Reinstall Katana
python3 setup.py install --user

# Come back to the docs folder to build the documentation from a clean slate
popd
rm -r build
make html
