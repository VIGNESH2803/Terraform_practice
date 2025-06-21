resource "aws_instance" "web1" {
    ami= var.ami_id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.myvpc-public-subnet.id
    security_groups = [ aws_security_group.public-sg.id ]
    root_block_device {
      delete_on_termination = true
      volume_size = 10
      volume_type = "gp3"

    }
}

resource "aws_instance" "App1" {
    ami= var.ami_id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.myvpc-private-subnet.id
    //security_groups = [ "value" ]
    root_block_device {
      delete_on_termination = true
      volume_size = 10
      volume_type = "gp3"
    }
}