# gooseLin

<img src="assets/images/goose.jpg" width="10%" alt="Logo">

# Goose Agent Setup with Ollama API

This script automates the process of installing and configuring the **Goose Agent** on a Linux system to interact with a remote **Ollama API** server. The script handles the installation of the Ollama API, creation and pushing of the model, configuring the Goose agent, testing the network connectivity, and printing a success message.

The script performs the following tasks:

1. Installs the **Ollama API** and starts the service in the background using `nohup` to ensure it continues running after the terminal is closed.
2. Creates and pushes the model to the Ollama server using the `ollama create` and `ollama push` commands.
3. Updates the **Modefile** to set the correct Ollama API URL and configure the model provider to **Ollama**.
4. Performs a connectivity test to verify that the Ollama API server is reachable on port `11434`.
5. Prints a success message confirming that all tasks have completed successfully and the Ollama API server is reachable.

## Script Usage

1. Save the script as `setup_goose_agent.sh`.
2. Make the script executable:

   ```bash
   chmod +x setup_goose_agent.sh

