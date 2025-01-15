# Camunda RPA Runtime for macOS

This project is an adaptation and customization of the **Camunda RPA Runtime** for **Windows**, tailored for **macOS** to allow the execution of the RPA runtime locally on macOS machines.

## Setup Instructions

To get started with the Camunda RPA Runtime on macOS, follow these steps:

### 1. Download the Official Camunda RPA Runtime

First, download the official Camunda RPA Runtime from the GitHub repository:

- [Camunda RPA Runtime Official GitHub](https://github.com/camunda/rpa-runtime/archive/refs/heads/main.zip)

### 2. Modify the Official Camunda Runtime

After extracting the project, make the following modifications:

- Delete the following files from the original Camunda project:
  - `setup.ps1`
  - `start.ps1`
  - `requirements.txt`

### 3. Copy Custom Scripts

Copy the following files from this project into the official Camunda RPA Runtime folder:

- `setup.sh`
- `start.sh`
- `requirements.txt`

### 4. Open Terminal

Open a terminal window and navigate to the official Camunda RPA Runtime folder.

### 5. Run the Setup Script

Execute the setup script by running the following command in the terminal:

```bash
./setup.sh
```

During the execution of the script, you will be prompted to complete the `dev.env` file. To do this:

- **Generate Client Credentials** by following the guide here: [Create Client Credentials](https://docs.camunda.io/docs/8.5/guides/setup-client-connection-credentials/#create-a-client).
- Add the generated credentials into the `dev.env` file, then save and confirm that you have completed this step by pressing **Enter** when prompted by the script.

### 6. Start the Runtime

Once the setup is complete and the `dev.env` file is configured correctly, you can start the RPA runtime by executing:

```bash
./start.sh
```

## Troubleshooting

If you encounter any issues during setup or runtime, please create an issue on the GitHub repository and include the following information:

- Error messages (if any)
- Steps you have already followed
- Your macOS version
- The version of the Camunda RPA Runtime you are using
