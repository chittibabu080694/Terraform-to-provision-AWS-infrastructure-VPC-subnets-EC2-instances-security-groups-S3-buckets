# AWS Infrastructure Provisioning with Terraform

Automated infrastructure provisioning on AWS using **Terraform (IaC)**. This project creates a secure, modular, and scalable cloud architecture containing custom networking, compute instances, security controls, and storage without manual console operations.

---

## 🏗️ Architecture Overview

The Terraform configuration provisions the following AWS resources:
* **VPC (`vpc.tf`):** Custom Virtual Private Cloud (`10.0.0.0/16`) with DNS support enabled.
* **Internet Gateway (`vpc.tf`):** Enables public internet access for the VPC.
* **Public Subnet (`vpc.tf`):** Configured with auto-assigned public IP addresses (`10.0.1.0/24`).
* **Route Tables (`vpc.tf`):** Directs public internet traffic (`0.0.0.0/0`) via the Internet Gateway.
* **Security Group (`security_groups.tf`):** Controls ingress/egress traffic, permitting SSH (Port 22) and HTTP (Port 80) access.
* **EC2 Instance (`ec2.tf`):** Provisions an Ubuntu 22.04 LTS instance inside the public subnet.
* **S3 Bucket (`s3.tf`):** Secure storage bucket equipped with versioning and strict public access blocks.
* **Outputs (`outputs.tf`):** Exposes key resource attributes (EC2 Public IP and S3 Bucket Name) post-deployment.

---

## 📁 Repository Structure

```text
├── provider.tf        # AWS Provider configuration (HashiCorp AWS ~> 5.0)
├── variables.tf       # Input variables (Region, Environment)
├── vpc.tf             # VPC, Subnet, Internet Gateway, and Route Tables
├── security_groups.tf # Firewall and security group rules
├── ec2.tf             # EC2 Ubuntu 22.04 instance definition
├── s3.tf              # S3 storage bucket with versioning & security blocks
└── outputs.tf         # Deployment output parameters
