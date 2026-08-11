# Secure Multi-Tier Network and Web Server (IaC)

A Terraform-managed Infrastructure as Code (IaC) configuration that provisions a highly secure, public-private network topology on AWS and deploys an automated, bootstrapped Apache web server.

---

## Architectural Overview

This architecture implements a multi-tier network topology to isolate internal compute layers from direct internet exposure, enforcing strict compliance and defensive boundaries.

* **Custom VPC:** Deploys a dedicated `10.0.0.0/16` classless inter-domain routing (CIDR) block.
* **Subnet Isolation:** Segregates traffic into `1 Public Subnet` (ingress) and `1 Private Subnet` (isolated backend layer).
* **Perimeter Defense:** Implements AWS Security Groups restricting ingress traffic strictly to HTTP (`Port 80`).
* **Automated Compute Layer:** Launches an Amazon Linux 2023 EC2 instance configured with an inline `user_data` shell bootstrap script to install, configure, and initialize Apache (`httpd`) on launch.

---

## Tech Stack

* **Cloud Infrastructure Provider:** AWS (VPC, Subnets, Internet Gateway, Route Tables, Security Groups, EC2)
* **Infrastructure as Code Platform:** Terraform `v1.5+`
* **Operating System & Web Server:** Amazon Linux 2023, Apache HTTP Server (`httpd`)

---

## Prerequisites

Before deploying, ensure you have the following prerequisites configured on your local machine:

1. **AWS CLI:** Installed and configured with appropriate IAM administrative permissions.
2. **Terraform CLI:** Version `v1.5+` installed locally.

---

## Deployment Instructions

Follow these sequential steps to initialize, preview, and deploy the infrastructure.

### 1. Initialize Working Directory
Prepare the directory and download the required AWS provider plug-ins:
```bash
terraform init
```

### 2. Preview Infrastructure Plan
Generate and review an execution plan to verify resource creation changes:
```bash
terraform plan
```

### 3. Apply Configuration
Deploy the end-to-end network and compute infrastructure to your live AWS account:
```bash
terraform apply --auto-approve
```

---

## Clean Up & Teardown

To prevent unexpected runtime costs and clean up active cloud resources, destroy the infrastructure when finished:
```bash
terraform destroy --auto-approve
```
