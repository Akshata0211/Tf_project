# Terraform block to specify required providers and their versions
terraform {
  required_providers {
    # Specify the AWS provider, its source, and version constraint
    aws = {
      source  = "hashicorp/aws"  # Source of the provider (official HashiCorp AWS provider)
      version = "~> 5.0"         # Version constraint - compatible with version 5.0 or higher but less than 6.0
    }
  }
}

# Configure the AWS Provider to interact with AWS resources
provider "aws" {
  # Set the AWS region for resource creation (in this case, 'us-west-1' - Northern California)
  region = "us-west-1"
}
