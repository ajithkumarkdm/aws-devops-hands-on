\# AWS Infrastructure Automation and Kubernetes Deployment



\## Project Overview



This project demonstrates AWS infrastructure provisioning using Terraform, configuration management using Ansible, and application deployment using Kubernetes.



\## Tasks Completed



\### Task 1: AWS Infrastructure with Terraform



\- Created a custom VPC with CIDR `172.16.0.0/16`.

\- Created three public subnets.

\- Configured an Internet Gateway and public route table.

\- Configured security groups for controlled access.

\- Provisioned Bastion, Kubernetes Master, and Worker EC2 instances.

\- Used Terraform variables and outputs to manage infrastructure configuration.



\*\*Technologies:\*\* AWS, Terraform, VPC, EC2, IAM, Security Groups.



\### Task 2: Ansible Automation



\- Used the Bastion EC2 instance as the Ansible controller.

\- Configured an inventory for the Master and Worker nodes.

\- Automated prerequisite installation and kernel networking settings.

\- Installed and configured containerd.

\- Automated installation of kubelet, kubeadm, and kubectl.



\*\*Technologies:\*\* Ansible, YAML, Linux, Ubuntu, containerd.



\### Task 3: Kubernetes Cluster and Nginx



\- Initialized the Kubernetes control plane using kubeadm.

\- Joined the Worker node to the cluster.

\- Configured Calico networking.

\- Verified that both Kubernetes nodes reached the Ready state.

\- Deployed Nginx using a Kubernetes Deployment.

\- Exposed Nginx through a NodePort Service on port `31309`.

\- Verified the application response using HTTP.



\*\*Technologies:\*\* Kubernetes, kubeadm, Calico, Nginx, YAML.



\## Repository Structure



```text

.

├── ansible/

│   ├── inventory.example.ini

│   └── playbooks/

│       ├── prepare-kubernetes.yml

│       └── install-kubernetes.yml

├── kubernetes/

│   └── nginx-deployment.yaml

├── bastion.tf

├── key\_pairs.tf

├── master.tf

├── output.tf

├── provider.tf

├── variable.tf

├── vpc.tf

├── worker.tf

├── .gitignore

└── README.md

```



\## How to Use



1\. Configure AWS credentials securely.

2\. Create a local `terraform.tfvars` file using your own values.

3\. Review the Terraform configuration before provisioning resources.

4\. Configure Ansible inventory using your own server details.

5\. Run the Ansible playbooks against the intended hosts.

6\. Apply the Kubernetes manifest from a machine configured with access to the cluster.



\## Security Notes



\- Private SSH keys, Terraform state files, and `terraform.tfvars` are excluded from Git.

\- Use placeholder values in example configuration files.

\- Restrict SSH and Kubernetes access to trusted sources.

\- Review all infrastructure changes before running `terraform apply`.



\## Project Status



Completed and tested in AWS. The Kubernetes nodes reached Ready status, and the Nginx application returned HTTP 200 OK through the NodePort service.

