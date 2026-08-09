# Secure Multi-Tier Network and Web Server (IaC)

A Terraform-managed Infrastructure as Code configuration that provisions a public-private network topology on AWS and deploys an automated Apache web server.

## Architectural Overview
This architecture divides networks into distinct public and private subnet tiers to isolate internal computation layers from direct internet exposure.
* Custom VPC: Deploys a dedicated 10.0.0.0/16 classless network infrastructure block.
* Subnet Isolation: Hosts 1 Public Subnet and 1 Private Subnet.
* Firewall Configuration: Implements Security Groups restricting ingress traffic strictly to HTTP on Port 80.
* Automated Compute: Launches an Amazon Linux 2023 EC2 host running an inline user_data shell bootstrap script to install and initialize Apache.

## Tech Stack
* Cloud Infrastructure Provider: AWS (VPC, Subnets, Internet Gateway, Route Tables, Security Groups, EC2)
* Infrastructure as Code Platform: Terraform v1.5+
* System Service Engine: Amazon Linux 2023, Apache Web Services (httpd)

## Prerequisites
* AWS CLI configured with appropriate IAM permissions
* Terraform CLI (v1.5+) installed locally

## Deployment Instructions
1. Initialize the provider plug-in configuration directory:
   ```bash
   terraform init
   ```
2. Preview the infrastructure execution plan:
   ```bash
   terraform plan
   ```
3. Deploy the resources to AWS:
   ```bash
   terraform apply --auto-approve
   ```
4. Teardown active test resources to prevent unexpected runtime costs:
   ```bash
   terraform destroy --auto-approve
   ```
