from llmtuner import create_ui
import os

def main():
    prefix = os.environ["PROXY_PREFIX"]
    print(f"PROXY_PREFIX:{prefix}")
    create_ui().queue().launch(server_name="0.0.0.0", server_port=None, share=False, inbrowser=True, root_path=prefix)


if __name__ == "__main__":
    main()