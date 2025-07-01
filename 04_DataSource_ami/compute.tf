data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

output "amivalue" {
  value = data.aws_ami.ubuntu.id

}

resource "aws_instance" "datablocktest-ec2" {

  ami =data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

}