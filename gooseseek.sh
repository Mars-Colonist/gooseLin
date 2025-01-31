#!/bin/bash

# Set variables for Ollama API URL and Goose configuration file path
OLLA_API_URL="http://10.16.28.100:11434"
GOOSE_CONFIG_PATH="$HOME/.goose/Modelfile"

# Task a) Install and start Ollama API
echo "Installing and starting the Ollama API service..."
curl -fsSL https://ollama.com/install.sh | bash
nohup ollama api start --port 11434 &

# Task b) Create and push the model to Ollama
echo "Creating and pushing the model to Ollama..."
ollama create michaelneale/deepseek-r1-goose -f $GOOSE_CONFIG_PATH
ollama push michaelneale/deepseek-r1-goose

# Task c) Update the Modelfile with the Ollama API URL and set model provider
echo "Updating the Modelfile with the Ollama API URL and setting the model provider..."
sed -i "s|goose_config.*--ollama_api_url=.*|goose_config --ollama_api_url=$OLLA_API_URL|" "$GOOSE_CONFIG_PATH"
sed -i "s|model_provider=.*|model_provider=Ollama|" "$GOOSE_CONFIG_PATH"

# Task d) Perform network test to ensure the Ollama API server is reachable
echo "Performing network test to verify connectivity to the Ollama API server..."
curl --silent --head --connect-timeout 5 $OLLA_API_URL
if [ $? -ne 0 ]; then
    echo "Error: Unable to reach Ollama API server at $OLLA_API_URL"
    exit 1
fi

# Task e) Print success message
echo "All tasks have completed successfully. The remote Ollama API server is reachable on port 11434."
