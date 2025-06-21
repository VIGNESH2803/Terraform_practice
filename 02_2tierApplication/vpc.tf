

resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "myvpc-public-subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "11.0.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "myvpc-private-subnet" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = "11.0.2.0/24"
  availability_zone = aws_subnet.myvpc-public-subnet.availability_zone
  map_public_ip_on_launch = false

}

resource "aws_internet_gateway" "myvpc-igw" {
  vpc_id = aws_vpc.my-vpc.id
}

resource "aws_route_table" "myvpc-public_route_table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myvpc-igw.id
  }

}

resource "aws_route_table_association" "RT_association" {
  route_table_id = aws_route_table.myvpc-public_route_table.id
  subnet_id      = aws_subnet.myvpc-public-subnet.id
}

resource "aws_security_group" "public-sg" {
    vpc_id = aws_vpc.my-vpc.id
    name = "allow traffic"
}

resource "aws_security_group_rule" "allow-port-80" {
    from_port = 80
    protocol = "tcp"
    security_group_id = aws_security_group.public-sg.id
    cidr_blocks = ["0.0.0.0/0"]
    to_port = 80
    type = "ingress"   
}

