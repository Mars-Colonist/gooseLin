# gooseSeek - Agentic AI for Red Team

<img src="assets/images/goose.jpg" width="10%" alt="Logo">

### Goose Agent (Linux) ---> Remote Ollama API Server + Jailbroken D33pSeek R1

This script automates the process of installing and configuring the **Goose Agent** on a Linux system to interact with a remote **Ollama API** server. The script handles the installation of the Ollama API, creation and pushing of the model, configuring the Goose agent, testing the network connectivity, and printing a success message.

The script performs the following tasks:

1. Installs the **Ollama API** and starts the service in the background using `nohup` to ensure it continues running after the terminal is closed.
2. Creates and pushes the model to the Ollama server using the `ollama create` and `ollama push` commands.
3. Updates the **Modelfile** to set the correct Ollama API URL and configure the model provider to **Ollama**.
4. Performs a connectivity test to verify that the Ollama API server is reachable on port `11434`.
5. Prints a success message confirming that all tasks have completed successfully and the Ollama API server is reachable.

### Script Usage

1. Save the script as `gooselin.sh'.
2. Make the script executable:

   ```bash
   chmod +x gooselin.sh
3. Execute the script
   ```bash
   ./gooselin.sh

### Example Output
 ```bash
 Installing and starting the Ollama API service...
 Creating and pushing the model to Ollama...
 Updating the Modelfile with the Ollama API URL and setting the model provider...
 Performing network test to verify connectivity to the Ollama API server...
 All tasks have completed successfully. The remote Ollama API server is reachable on port 11434.

