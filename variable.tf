variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "public_subnet_cidrs" {
  type = list(string)
}


variable "aws_ec2_key_pair_name" {
  type = string
}

variable "aws_ec2_key_pair_public_key" {
  type = string
}

# Your public IP for SSH access
variable "my_ip" {
  type = string
}

# EC2 instance type
variable "bastion_instance_type" {
  default = "t3.small"
}

# Ubuntu hostname
variable "bastion_hostname" {
  default = "bastion.test.com"
}

# master instance type
variable "master_instance_type" {
  default = "c7i-flex.large"
}

#master host name
variable "master_hostname" {
  default = "master.test.com"
}

# Worker instance type
variable "worker_instance_type" {
  default = "c7i-flex.large"
}

# Worker hostname
variable "worker_hostname" {
  default = "worker.test.com"
}