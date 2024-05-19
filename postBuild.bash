#!/bin/bash
# This file contains bash commands that will be executed at the end of the container build process,
# after all system packages and programming language specific package have been installed.
#
# Note: This file may be removed if you don't need to use it
set -e
cd ~
sudo apt install -y python3.10-venv
python3 -m venv llama-factory-env
git clone -b v0.7.0 https://github.com/hiyouga/LLaMA-Factory.git
cd LLaMA-Factory
$HOME/llama-factory-env/bin/pip install -e .[metrics]
$HOME/llama-factory-env/bin/pip install bitsandbytes>=0.43.0
