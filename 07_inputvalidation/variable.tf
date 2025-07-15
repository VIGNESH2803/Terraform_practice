variable "ami_id" {

  default     = "ami-0ec1dd79c99a983c9"
  type        = string
  description = "value of the AMI to create EC2"

}

variable "volume_size" {
  default     = 30
  type        = number
  description = "provide the volume size in GB"

  validation {
    condition     = var.volume_size < 20
    error_message = "Volume size has to be less than 20"
  }
}




variable "aws_instance_type" {

  default     = "t2.micro"
  type        = string
  description = "value of the AMI to create EC2"


  validation {
    condition     = var.aws_instance_type == "t2.micro" || var.aws_instance_type == "t3.micro"
    error_message = "this program accepts only t2 or t3 micro as input"
  }

}
