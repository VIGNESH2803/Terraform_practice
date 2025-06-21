variable "vpc_cidr" {
    description = "prvide the cidr range for the VPC"
    type = string
    default = "10.0.0.0/16"  # this consist of 65536 IP address 
}

variable "ami_id"{
    description = "prvide the Ami ID to be deployed in the EC2"
    type = string
    default = "ami-0cbad6815f3a09a6d"  # this consist of 65536 IP address 
} 