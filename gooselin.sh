#!/bin/bash

# Set variables
OLLA_API_URL="http://10.16.28.100:11434"
GOOSE_CONFIG_PATH="$HOME/.goose/Modefile"  # Modify if necessary
MODEL_NAME="michaelneale/deepseek-r1-goose"
MODEL_FILE="Modelfile"

# Task a) Install and start the Ollama API service
echo "Installing and starting the Ollama API service..."

# Download Ollama installation script and install
curl -fsSL https://ollama.com/install.sh | bash

# Start the Ollama API service in the background
nohup ollama api start --port 11434 &

# Wait for Ollama API service to start
sleep 10  # Adjust the sleep time if necessary for the API to fully start

# Task b) Create and push the model to Ollama
echo "Creating and pushing the model to Ollama..."

# Create and push the model
ollama create $MODEL_NAME -f $MODEL_FILE
ollama push $MODEL_NAME

# Check if the Ollama commands executed successfully
if [ $? -ne 0 ]; then
    echo "Error: Ollama commands failed to execute successfully."
    exit 1
fi

# Task c) Update Modefile to include Ollama API URL and set model provider
echo "Updating the Modefile with the Ollama API URL and setting the model provider..."

# Check if the file exists before modifying
if [ ! -f "$GOOSE_CONFIG_PATH" ]; then
    echo "Error: Modefile not found at $GOOSE_CONFIG_PATH"
    exit 1
fi

# Update Modefile with Ollama API URL and set model provider to Ollama
sed -i "s|goose_config.*--ollama_api_url=.*|goose_config --ollama_api_url=$OLLA_API_URL|" "$GOOSE_CONFIG_PATH"
# Ensure model provider is set to Ollama
sed -i "s|model_provider=.*|model_provider=Ollama|" "$GOOSE_CONFIG_PATH"

# Task d) Network test to verify connectivity to the Ollama API server
echo "Performing network test to verify connectivity to the Ollama API server..."

# Test connectivity to the Ollama API server on port 11434 using curl
curl --silent --head --connect-timeout 5 http://10.16.28.100:11434
if [ $? -ne 0 ]; then
    echo "Error: Unable to reach Ollama API server at $OLLA_API_URL"
    exit 1
fi

# Task e) Print success message
echo "All tasks have completed successfully. The remote Ollama API server is reachable on port 11434."
