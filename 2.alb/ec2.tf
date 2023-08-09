/* provider "aws" {
  region = "ap-northeast-2"
}
*/

# 최신 Amazon Linux 2 의 AMI 를 확인하여 EC2 를 생성
data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}


resource "aws_instance" "example-2a" {
  ami           = data.aws_ami.amzn2.id # 위의 data 값을 불러옵니다.
  instance_type = "t2.micro"
  key_name      = "tf-kjw"
  vpc_security_group_ids = [aws_security_group.lb_sg.id]
  subnet_id = "subnet-0228d203585ee6ebd"
  availability_zone = "ap-northeast-2a"
  user_data = file("./user_data.sh")
  
  tags = {
    Name = "Terraform-ec2-2a"
  }
}

resource "aws_instance" "example-2c" {
  ami           = data.aws_ami.amzn2.id # 위의 data 값을 불러옵니다.
  instance_type = "t2.micro"
  key_name      = "tf-kjw"
  vpc_security_group_ids = [aws_security_group.lb_sg.id]
  subnet_id = "subnet-038a3f5437d1e128c"
  availability_zone = "ap-northeast-2c"
  user_data = file("./user_data.sh")

  tags = {
    Name = "Terraform-ec2-2c"
  }
}