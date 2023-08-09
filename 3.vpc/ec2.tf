data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.????????.?-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_security_group" "allow_web-sg" {
  name        = "allow_web-sg"
  description = "Allow web-sg inbound traffic"
  vpc_id      = aws_vpc.vpc-10-0-0-0.id

  ingress {
    description = "web from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web-sg"
  }
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.micro"
  key_name = "tf-kjw"
  vpc_security_group_ids = [aws_security_group.allow_web-sg.id]
  availability_zone = "ap-northeast-2a"
  subnet_id = aws_subnet.sub-pub1-10-0-1-0.id
  user_data = file("./userdata.sh")

  root_block_device {
      volume_size = 30
  }

  tags = {
    Name = "bastion"
  }

}

resource "aws_instance" "web-2a" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.micro"
  key_name = "tf-kjw"
  vpc_security_group_ids = [aws_security_group.allow_web-sg.id]
  availability_zone = "ap-northeast-2a"
  subnet_id = aws_subnet.sub-pri1-10-0-3-0.id
  user_data = file("./userdata.sh")

  root_block_device {
      volume_size = 30
  }

  tags = {
    Name = "web-2a"
  }

}

resource "aws_instance" "web-2c" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.micro"
  key_name = "tf-kjw"
  vpc_security_group_ids = [aws_security_group.allow_web-sg.id]
  availability_zone = "ap-northeast-2c"
  subnet_id = aws_subnet.sub-pri2-10-0-4-0.id
  user_data = file("./userdata.sh")

  root_block_device {
      volume_size = 30
  }

  tags = {
    Name = "web-2c"
  }

}