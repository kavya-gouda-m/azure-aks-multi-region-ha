# Azure AKS Multi-Region HA: Setup Steps

## Date: August 30, 2025

This document records the installation and setup steps performed for the project.

---

### 1. Install Terraform (Stable Version)
- Download Terraform zip:
  ```powershell
  Invoke-WebRequest -Uri "https://releases.hashicorp.com/terraform/1.8.4/terraform_1.8.4_windows_amd64.zip" -OutFile "$env:USERPROFILE\Downloads\terraform.zip"
  ```
- Extract the zip:
  ```powershell
  Expand-Archive -Path "$env:USERPROFILE\Downloads\terraform.zip" -DestinationPath "$env:USERPROFILE\Downloads\terraform" -Force
  ```
- Create destination folder and move binary:
  ```powershell
  New-Item -ItemType Directory -Path "C:\terraform" -Force
  Move-Item -Path "$env:USERPROFILE\Downloads\terraform\terraform.exe" -Destination "C:\terraform\terraform.exe" -Force
  ```
- Add to PATH (current session):
  ```powershell
  $env:Path += ";C:\terraform"
  ```
- Verify installation:
  ```powershell
  terraform -version
  ```

---

### 2. Install Azure CLI
- Using winget (if available):
  ```powershell
  winget install Microsoft.AzureCLI
  ```
- If winget is not available, download "App Installer" from Microsoft Store to enable winget.
- If network issues, manually download Azure CLI from:
  https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows

---

### 3. Authenticate with Azure
- Standard login:
  ```powershell
  az login
  ```
- If Multi-Factor Authentication (MFA) is required or for a specific tenant:
  ```powershell
  az login --tenant <TENANT_ID>
  ```
  Replace `<TENANT_ID>` with your actual tenant ID.

---

### Notes
- Errors encountered and resolved:
  - `winget` not found: Installed via Microsoft Store (App Installer).
  - Network/DNS issues: Used manual download links.
  - Azure login required MFA: Used `az login --tenant <TENANT_ID>`.

---

This document will be updated with further steps and troubleshooting as the project progresses.
