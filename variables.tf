variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "Allowed CIDR for SSH access"
  type        = list(string)
}

variable "allowed_http_cidr" {
  description = "Allowed CIDR for HTTP access"
  type        = list(string)
}

variable "key_pair_name" {
  description = "Name of the AWS key pair"
  type        = string
}