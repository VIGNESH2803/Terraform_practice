variable "aws-region" {
    type = string
  default = "eu-west-1"
  description = "provide the value of the region"
}

variable "instance_type" {
    default = "t2.micro"
    description="Provide the type of the AWS instance "
}


