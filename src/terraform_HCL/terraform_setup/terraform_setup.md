# Install Terraform

Download the version for your OS.
 [https://developer.hashicorp.com/terraform/downloads](https://developer.hashicorp.com/terraform/downloads)

Unzip the file and move terraform.exe to a permanent folder, e.g.:
`C:\Terraform\terraform.exe` Add this folder to your PATH environment variable:

Windows 10/11:
Right-click This PC → Properties → Advanced system settings → Environment Variables

Edit Path under System variables → Add `C:\Terraform\`

# Test: in your pycharm terminal

`terraform version`

# Create a Terraform Configuration File
Example: demo.tf

output "hello" {
  value = "hello world"
}

# Initialize Terraform
First cd to your working directory, where you created terraform configuration file

`terraform init`

# Plan the Changes

`terraform plan`

# Apply the Configuration

`terraform apply`
`terraform apply -auto-approve` Terraform will prompt for confirmation (yes) before creating resources.

# Destroy Resources (Clean Up)

`terraform destroy`
