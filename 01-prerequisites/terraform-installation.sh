# Download Terraform zip
Invoke-WebRequest -Uri "https://releases.hashicorp.com/terraform/1.8.4/terraform_1.8.4_windows_amd64.zip" -OutFile "$env:USERPROFILE\Downloads\terraform.zip"

# Create extraction folder
New-Item -ItemType Directory -Path "$env:USERPROFILE\Downloads\terraform" -Force

# Extract the zip
Expand-Archive -Path "$env:USERPROFILE\Downloads\terraform.zip" -DestinationPath "$env:USERPROFILE\Downloads\terraform" -Force

# Create destination folder
New-Item -ItemType Directory -Path "C:\terraform" -Force

# Move terraform.exe to C:\terraform
Move-Item -Path "$env:USERPROFILE\Downloads\terraform\terraform.exe" -Destination "C:\terraform\terraform.exe" -Force

# Add C:\terraform to PATH for current session
$env:Path += ";C:\terraform"

# Verify installation
terraform -version