# Damn Vulnerable LLM Agent

## Introduction
Welcome to the *Damn Vulnerable LLM Agent*! This project is a sample chatbot powered by a Large Language Model (LLM) ReAct agent, implemented with Langchain. It's designed to be an educational tool for security researchers, developers, and enthusiasts to understand and experiment with prompt injection attacks in ReAct agents. 

The project specifically focuses on Thought/Action/Observation injection, as described in the WithSecure Labs [publication](https://labs.withsecure.com/publications/llm-agent-prompt-injection) and accompanying [video tutorial](https://www.youtube.com/watch?v=43qfHaKh0Xk).

This repository is an adaptation of a challenge created by WithSecure for the Capture The Flag (CTF) competition held at BSides London 2023.

![DVLM Demo](dvla-demo.gif)


## Features
- Simulates a vulnerable chatbot environment.
- Allows for prompt injection experimentation.
- Provides a ground for learning prompt injection vectors.

## Installation

### Pipenv Installation

To get started, you need to set up your Python environment by following these steps:

```sh
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
pip install python-dotenv
```

### Running the Application

Before running the application, you need to setup a .env file based on the provided env templates. The env templates have a model_name variable which can be chosen from the list of models mentioned in llm-config.yaml.

#### To run with OpenAI
You need to drop a valid OpenAI API key in the .env file (that you can create by copying the .env.openai.template).

#### To run with Models from HuggingFace
You need to drop a valid HuggingFace Token in the .env file (that you can create by copying the .env.huggingface.template). Note: It is possible that you may not see reasonable results with the chosen models yet.

#### To run using ollama locally
- Create a .env by copying .env.ollama.template.
- Change the default model to any ollama model you want to use by editing `llm-config.yaml`
- Install [Ollama](https://github.com/ollama/ollama)
- ollama pull mistral-nemo

Note: Please note that small LLMs do not perform very well as ReACT agents. In our testing `mistral-nemo` appeared to be sufficiently reliable. It is possible that you may not see reasonable results with most small models.

#### To run the application:

```sh
python -m streamlit run main.py
```

### Docker Image

To build and run the Docker image:

```sh
docker build -t dvla .

# Populate the env.list with necessary environment variables (just the OpenAI API key), then run:
docker run --env-file env.list -p 8501:8501 dvla

```

## Usage

To interact with the vulnerable chatbot and test prompt injection, start the server and begin by issuing commands and observing responses.


## Contributing

Contributions are welcome! If you would like to help make DVLA better, please submit your pull requests, and don't hesitate to open issues if you encounter problems or have suggestions.

We're particularly interested in adapting DVLA to support LLMs other than GPT-4 and GPT-4 Turbo, so if you get this to work with an open-source LLM, please consider doing a pull request. 

## License

This project is released open-source under the Apache 2.0 license. By contributing to the Damn Vulnerable LLM Agent, you agree to abide by its terms.

## Contact

For any additional questions or feedback, please [open an issue](https://github.com/WithSecureLabs/damn-vulnerable-llm-agent/issues) on the repository.

Thank you for using *Damn Vulnerable LLM Agent*! Together, let's make cyberspace a safer place for everyone.
```
