# General

variable "environment" {
  description = "Environment name (production, staging, demo...)"
  type = string
  default = "production"
}

# Hostnames

variable "wg_access_server_host_name" {
  description = "The host name for the wg access server"
  type        = string
}

variable "dex_host_name" {
  description = "The host name for the dex server"
  type        = string
}

# Networking - Instance

variable "vpc_id" {
  description = "ID of VPC where server should be hosted in"
  type = string
}

variable "vpc_cidr" {
  description = "CIDR of VPC where server should be hosted in"
  type = string
}

variable "vpc_subnet_id" {
  description = "ID of subnet where server should be hosted in"
  type = string
}

variable "ec2_instance_type" {
  description = "Type for ec2 instance"
  type = string
  default = "t3.medium"
}

variable "ec2_ami_id" {
  description = "AMI for ec2 instance"
  type = string
  default = ""
}

variable "wg_access_server_listening_tcp_port" {
  description = "The TCP port where wg-access-server should listen on"
  type = number
}

variable "wg_access_server_listening_udp_port" {
  description = "The UDP port where wg-access-server should listen on"
  type = number
}

variable "dex_listening_tcp_port" {
  description = "The TCP port where dex server should listen on"
  type = number
  default = 8090
}

variable "additional_security_group_ids" {
  type        = list(string)
  default     = [""]
  description = "Additional security groups if provided, default empty"
}

variable "volume_size" {
  description = "Volume size for ec2 instance"
  type = number
  default = 50
}
variable "ssh_key_name" {
  description = "SSH RSA Keypair name"
  type = string
}

# Config details

variable "wg_access_server_config" {
  description = "base64 encoded config file for wg access server"
  type = string
}