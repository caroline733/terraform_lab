resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = ["subnet-0228d203585ee6ebd","subnet-038a3f5437d1e128c"]
#  subnets            = aws_subnet.public.*.id

  enable_deletion_protection = false

/*
  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }
*/

  tags = {
    Name = "aws_lb"
  }

}

resource "aws_security_group" "lb_sg" {
  name        = "lb_sg"
  description = "Allow web inbound traffic"
  vpc_id      = "vpc-048f2a5aa67d27aff" # 사용하고자하는 VPC ID 입력

  ingress { # all traffic
    description = "Web from VPC"
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
    Name = "allow_web"
  }
}
