# GooseLin
## Goose AI Agent Install + Remote Ollama API Server
<img src="assets/images/goose.jpg" width="10%" alt="Logo">

- Explanation of the Script:
Task a) Install and Start Ollama API:

- Downloads and installs the Ollama API service from the provided script.
Starts the Ollama API service in the background using nohup to ensure it continues running.
Task b) Create and Push the Model:

- Runs ollama create and ollama push to create and push the model (deepseek-r1-goose) to the Ollama server.
Task c) Update Modefile:

- Modifies the Modefile to include the remote Ollama API URL (http://10.16.28.100:11434).
Ensures the model_provider in the Modefile is set to "Ollama".
Task d) Network Test:

- Performs a network test using curl to check if the Ollama API server is reachable on port 11434.
The curl command makes an HTTP request to the server and verifies the response headers.
Task e) Print Success Message:

If all tasks complete successfully, a success message is printed.
