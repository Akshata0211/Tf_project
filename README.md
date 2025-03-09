# Terraform Static Website Hosting with AWS S3

This Terraform project automates the process of creating an AWS S3 bucket for static website hosting. It involves configuring the S3 bucket to serve static content such as HTML files, along with applying necessary settings for public access and ownership control. The goal of this project is to deploy a static website with minimal manual intervention using Terraform.

## Key Features:
**S3 Bucket Creation**: Creates an S3 bucket that will host the static website.
**Static Website Hosting**: Configures the S3 bucket to serve an index.html and error.html file.
**Public Access**: The S3 bucket is configured for public access to allow users to view the website from anywhere.
**Ownership Control and ACLs**: Ownership controls are applied to ensure the bucket owner has control over the objects, and ACLs are set to allow public-read access for the files.
**Automatic Resource Management**: Terraform handles the creation and management of AWS resources, providing a consistent and repeatable environment for static website hosting.

## Project Summary
This Terraform project demonstrates how to host a simple static website on AWS using S3. The main components of the project include:

**Terraform Configuration Files**:

**main.tf**: Defines the S3 bucket and its configurations, including the website hosting setup, ownership controls, and public access settings.
**output.tf**: Specifies the output variable that provides the URL of the hosted static website (S3 endpoint).
**provider.tf**: Configures the AWS provider to interact with AWS resources, including the region for provisioning resources.
**variables.tf**: Defines a variable for the bucket name, with a default value of aktfbucket23.

## Project WorkFlow
 
   Start by cloning the repository to your local machine:
   ```bash
   git clone https://github.com/Akshata0211/Tf_project.git
   ```
   Change to the project directory:
   ```bash
   cd Tf_project
   ```
   Verify the status of the repository using:
   ```bash
   git status
   ```
   To add all files or specific files for commit, run:
   ```bash
   git add .
   ```
   ```bash
   git add main.tf output.tf provider.tf variables.tf
   ```
   After adding the files, commit them with a message:
   ```bash
   git commit -m "Initial commit for static website hosting with Terraform"
   ```
   Push the committed changes to GitHub:
   ```bash
   git push origin main
   ```

## Running Terraform Code
 
   Initialize the Terraform configuration, which will download the necessary provider plugins:
   ```bash
   terraform init
   ```
   Generate and view the execution plan to ensure Terraform will create the desired resources:
   ```bash
   terraform plan
   ```
   Apply the configuration to create the AWS resources (S3 bucket and static website setup):
   ```bash
   terraform apply
   ```
   Verify the static website
   After Terraform has successfully created the infrastructure, you can visit the website at the provided S3 bucket endpoint. This will be a static site with the files such as index.html and error.html.

   If you want to destroy the infrastructure and remove all resources created by Terraform, run:
   ```bash
   terraform destroy
   ```
