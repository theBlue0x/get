#!/bin/bash

read -p "Do you want to continue? (y/n): " yn

case $yn in
    [Yy]* ) echo "Continuing...";;
    [Nn]* ) echo "Exiting..."; exit;;
    * ) echo "Invalid response. Please enter y or n.";;
esac
