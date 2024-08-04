# SPDX-FileCopyrightText: Copyright (c) <2024> NVIDIA CORPORATION & AFFILIATES. All rights reserved.
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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
pip install "nvidia-modelopt[all]~=0.11.0" --extra-index-url https://pypi.nvidia.com

