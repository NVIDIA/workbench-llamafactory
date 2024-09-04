#!/bin/bash

# exporting variable
export PROXY_PREFIX="/projects/workbench-llamafactory/applications/llamafactory"

# Other commands
cd $HOME/LLaMA-Factory
cp /project/code/train-web.py src/train-web.py
. $HOME/llama-factory-env/bin/activate
python src/train-web.py