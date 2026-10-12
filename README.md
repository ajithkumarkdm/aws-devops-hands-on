# AWS Infrastructure Automation & Kubernetes Deployment

A hands-on DevOps project demonstrating **Infrastructure as Code (IaC)**, configuration management, Kubernetes cluster setup, and application deployment on AWS.

## Project Overview

This project provisions AWS infrastructure using Terraform, automates server configuration using Ansible, and deploys an Nginx application on a Kubernetes cluster.

The goal is to demonstrate an end-to-end infrastructure automation workflow using commonly used DevOps tools.

## Technology Stack

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform)
![Ansible](https://img.shields.io/badge/Ansible-Automation-EE0000?logo=ansible)
![Kubernetes](https://img.shields.io/badge/Kubernetes-Orchestration-326CE5?logo=kubernetes)
![Ubuntu](https://img.shields.io/badge/Ubuntu-Linux-E95420?logo=ubuntu)
![Nginx](https://img.shields.io/badge/Nginx-Web_Server-009639?logo=nginx)

## Architecture Overview

```text
                    AWS Cloud
                       |
                 Custom VPC
              CIDR: 172.16.0.0/16
                       |
               Internet Gateway
                       |
              Public Route Table
                       |
          +------------+-------------+
          |            |             |
      Bastion EC2   Master EC2    Worker EC2
          |            |             |
          +------ Ansible Automation+
                       |
              Kubernetes Cluster
                (kubeadm + Calico)
                       |
                Nginx Deployment
                       |
                NodePort Service
                   Port 31309
                       |
                  HTTP Response
                    200 OK
```

## Tasks Implemented

### Task 1 — AWS Infrastructure Provisioning with Terraform

Provisioned the foundational AWS infrastructure using reusable Terraform configuration files.

**Implementation highlights**
- Created a custom VPC with CIDR `172.16.0.0/16`.
- Created three public subnets.
- Configured an Internet Gateway and public route table.
- Created security groups to control network access.
- Provisioned three EC2 instances: Bastion, Kubernetes Master, and Worker.
- Used Terraform variables and outputs to manage configuration and expose resource information.
- Managed infrastructure through Terraform state.

**Technologies:** AWS, Terraform, VPC, EC2, Internet Gateway, Route Tables, Security Groups.

### Task 2 — Configuration Management with Ansible

Used the Bastion EC2 instance as the Ansible controller to automate Kubernetes node preparation and software installation.

**Implementation highlights**
- Configured an inventory for the Master and Worker nodes.
- Automated prerequisite package installation.
- Configured required Linux kernel networking settings.
- Installed and configured containerd.
- Automated installation of `kubelet`, `kubeadm`, and `kubectl`.
- Validated playbook syntax before execution.

**Technologies:** Ansible, YAML, Ubuntu Linux, containerd, SSH.

### Task 3 — Kubernetes Cluster and Nginx Deployment

Set up a Kubernetes cluster and deployed a sample web application to validate the environment.

**Implementation highlights**
- Initialized the control plane using `kubeadm`.
- Joined the Worker node to the cluster.
- Configured Calico for pod networking.
- Verified that both cluster nodes reached the `Ready` state.
- Deployed Nginx using a Kubernetes Deployment.
- Exposed the application using a NodePort Service on port `31309`.
- Verified HTTP connectivity and received an `HTTP 200 OK` response.

**Technologies:** Kubernetes, kubeadm, Calico, Nginx, YAML, NodePort Service.

## Repository Structure

```text
aws-devops-hands-on/
├── ansible/
│   ├── inventory.example.ini
│   └── playbooks/
│       ├── prepare-kubernetes.yml
│       └── install-kubernetes.yml
├── kubernetes/
│   └── nginx-deployment.yaml
├── screenshots/
│   ├── task-1-terraform-resources.png
│   ├── task-1-terraform-vpc.png
│   ├── task-1-terraform-ec2-instances.png
│   ├── task-2-ansible-connectivity.png
│   ├── task-2-ansible-playbook.png
│   ├── task-2-ansible-syntax-check.png
│   ├── task-3-kubernetes-nodes.png
│   ├── task-3-nginx-service.png
│   └── task-3-nginx-http-response.png
├── bastion.tf
├── key_pairs.tf
├── master.tf
├── output.tf
├── provider.tf
├── variable.tf
├── vpc.tf
├── worker.tf
├── .gitignore
└── README.md
```

## Prerequisites

- An AWS account with appropriate permissions.
- Terraform CLI.
- AWS CLI with securely configured credentials.
- Ansible installed on the controller machine.
- SSH access to the intended EC2 instances.
- A Kubernetes client (`kubectl`) configured to access the cluster.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/ajithkumarkdm/aws-devops-hands-on.git
cd aws-devops-hands-on
```

### 2. Configure AWS credentials

Configure AWS CLI credentials using a secure method, such as an AWS profile or IAM role.

```bash
aws configure
```

Do not commit credentials to the repository.

### 3. Configure Terraform

Create a local `terraform.tfvars` file using your own AWS region, subnet CIDRs, SSH key pair name, and permitted management IP address.

Review the configuration and validate it:

```bash
terraform init
terraform fmt -check
terraform validate
terraform plan
```

Inspect the proposed changes before deciding whether to apply them.

### 4. Configure Ansible

Copy `ansible/inventory.example.ini` to a local inventory file and replace the placeholders with your own host details and SSH key path.

Validate the playbooks before execution:

```bash
ansible-playbook -i inventory prepare-kubernetes.yml --syntax-check
ansible-playbook -i inventory install-kubernetes.yml --syntax-check
```

Adjust the playbook paths and inventory path to match your working directory and environment.

### 5. Deploy the Nginx application

From a machine configured with access to the Kubernetes cluster, apply the manifest:

```bash
kubectl apply -f kubernetes/nginx-deployment.yaml
```

Verify the deployment and service:

```bash
kubectl get nodes -o wide
kubectl get pods,services -o wide
```

The example NodePort is `31309`. Ensure the relevant network access is restricted to trusted sources.

## Validation Results

- **Infrastructure:** Terraform resources provisioned in AWS.
- **Configuration management:** Ansible playbooks validated and executed.
- **Kubernetes:** Master and Worker nodes reached `Ready`.
- **Application:** Nginx Pod reached `Running`.
- **Connectivity:** HTTP request returned `200 OK` through the NodePort service.

Screenshots documenting the implementation and validation results are available in the `screenshots/` directory.

## Security Considerations

- Private SSH keys, Terraform state files, and `terraform.tfvars` are excluded from version control.
- Example inventory values are placeholders; configure real host details locally.
- Never commit AWS access keys, passwords, tokens, or private keys.
- Restrict SSH, Kubernetes API, and NodePort access to trusted sources.
- Review Terraform plans before applying infrastructure changes.
- Review AWS resource costs and clean up resources when they are no longer needed.

## Project Status

**Completed and tested in AWS.**

This project demonstrates an end-to-end workflow covering AWS infrastructure provisioning, Ansible-based configuration management, Kubernetes cluster setup, and Nginx application deployment.

---

**Author:** P. Ajith Kumar

**GitHub:** [ajithkumarkdm](https://github.com/ajithkumarkdm)

