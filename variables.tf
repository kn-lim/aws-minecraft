variable "name" {
  description = "Name of the Minecraft instance"
  type        = string
}

variable "region" {
  description = "Region of the Minecraft instance"
  type        = string
}

variable "access_key" {
  description = "AWS Access Key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}

variable "private_key" {
  description = "Private Key Path for SSH"
  type        = string
}

variable "public_key" {
  description = "Public Key Path for SSH"
  type        = string
}

variable "ami" {
  description = "AMI of the Minecraft instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type of the Minecraft instance"
  type        = string
}

variable "route53_zone" {
  description = "Route53 Zone to add CNAME Record"
  type        = string
}

variable "cname" {
  description = "CNAME of the Minecraft EC2 instance to add to Route53"
  type        = string
}

variable "server_url" {
  description = "URL to download the Minecraft server.jar"
  type        = string
}

variable "java_max_memory" {
  description = "Max amount of memory to allocate"
  type        = string
}

variable "personal_ip" {
  description = "Your Personal IP"
  type        = string
}

variable "personal_subnet" {
  description = "Your Personal Subnet"
  type        = string
}
