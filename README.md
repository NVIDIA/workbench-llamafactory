# RTX AI toolkit - Model Finetuning, quantization and inference



This is an [NVIDIA AI Workbench](https://www.nvidia.com/en-us/deep-learning-ai/solutions/data-science/workbench/) project to deploy [LLaMA-Factory](https://github.com/hiyouga/LLaMA-Factory).

### Please follow the RTX AI Toolkit tutorial to use this project at [https://github.com/NVIDIA/RTX-AI-Toolkit](https://github.com/NVIDIA/RTX-AI-Toolkit/-/blob/main/tutorial-llama3-finetune.md?ref_type=heads).



## Features

- Fine-tune an LLM using Llama factory.
- Fuse generated LoRA adapter with the base model.
- Apply Post Training Quantization to your model.
- Export model to TensorRT-LLM checkpoint.
- Use TensorRT-LLM to run inference

## Prerequisites

- Hugging Face API Token:- [See how to create one](https://huggingface.co/docs/hub/en/security-tokens).
- [Install and Configure](https://www.nvidia.com/en-us/deep-learning-ai/solutions/data-science/workbench/) AI Workbench locally.
- Clone this repo in AI Workbench.
- Add `Hugging Face Token` value in Secrets.
- After Container Build is done, Start `LlamaFactory` app and `Jupyter NotedBook` from the Apps.

## Finetuning
Fine-tuning is an important process in machine learning, where a pre-trained model is further trained on a smaller, task-specific dataset to adapt it for specific applications. This process significantly reduces the need for extensive data and computational resources typically required for training a model from scratch. Additionally, fine-tuned models often exhibit superior performance on specific tasks.

### Fine-tuning in Llamafactory App

To initiate the fine-tuning process, it's necessary to start the Llamafactory App from the AI Workbench environment. On LlamaFactory, you can fine-tune any available model with any custom dataset. Below are available fine-tuning methods in Llamafactory:

#### Full Fine-tuning Method
- In this method, all parameters (weights) of the model are trained on the new dataset. It's a comprehensive approach suitable for diverse datasets.

#### Freeze Fine-tuning Method
- Certain layers are frozen while allowing other layers to be updated during the training process on a new dataset. This method proves useful when the new dataset shares similarities with the original training dataset or when dealing with limited dataset.

#### LoRA Fine-tuning Method
- This method efficiently updates large pre-trained models by adjusting only a small subset of the model's weights using low-rank matrices. It eliminates the need to retrain the entire network, enhancing training efficiency.

#### Quantized LoRA Method
- The Quantized LoRA method combines the principles of LoRA (Low-Rank Adaptation) with quantization to fine-tune large pre-trained models more efficiently. You can opt for Quantized LoRA fine-tuning using the Advanced configuration. 

#### Advanced Configuration Options
- **Quantization Levels**- You can choose from three quantization levels: None, 8-bit, or 4-bit.
    - **None**:- Defaults to full 16-bit precision, performing standard LoRA fine-tuning.
    - **8-bit or 4-bit**: Apply quantization for QLoRA fine-tuning, reducing precision for enhanced efficiency.resource consumption.

We recommend using QLoRA PEFT technique on RTX PCs. To do fine-tuning using Llamafactory app, set custom configurations.
- Ensure you obtain access approval for the model you will be using from Hugging Face.
- Choose Model from Dropdown
- Choose Dataset from Dropdown
    - For using the **custom dataset**
        - Open JupyterLab
        - Add dataset file in the `data` directory.
        - Update the `dataset_info.json` file by adding object:-
        ```
            {
                model_name:
                {
                    file_name,
                    file_sha1
                }
            }
        ```
        - Change the `Data dir` value to `/project/data`.
- To save the results change the value of `Output dir` to `/project/$nameofDirectory`.
- You can change configurations in the `train` tab or can continue with the defaults ones.
- Click on `Start` Button in the Train tab.
- Adapters will get saved in `Output Directory`.

## Weight Merging & Model Optimization

Integrate the enhancements obtained from fine-tuning into the original model and optimize the model using the NVIDIA Model Optimizer.

- After adapters are saved to the output directory.
- Open Jupyter Lab.
- Open Notebook `quantization` in the `code` directory.

## Using TensorRT-LLM for Inference
Once the TensorRT-LLM compatible checkpoint is generated, TensorRT-LLM can be used to run inference. Refer to the TensorRT-LLM [documentation](https://nvidia.github.io/TensorRT-LLM/overview.html) for more details:
* [Install on Windows](https://nvidia.github.io/TensorRT-LLM/installation/windows.html)
* [Build an engine](https://nvidia.github.io/TensorRT-LLM/quick-start-guide.html#compile-the-model-into-a-tensorrt-engine)
* [Run Inference](https://nvidia.github.io/TensorRT-LLM/quick-start-guide.html#run-the-model)
