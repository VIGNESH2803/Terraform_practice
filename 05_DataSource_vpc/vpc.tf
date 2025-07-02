data "aws_vpc" "this-aws_vpc" {
    tags = {
      "env" = "Prod"
    }
  
}

output "this-vpc-id" {
    value = data.aws_vpc.this-aws_vpc.id
}

output "this-vpc-cidr" {
    value = data.aws_vpc.this-aws_vpc.cidr_block
}

resource "aws_subnet" "example" {
  vpc_id            = data.aws_vpc.this-aws_vpc.id
  availability_zone = "eu-west-1a"
  cidr_block        = cidrsubnet(data.aws_vpc.this-aws_vpc.cidr_block, 4, 1)
}