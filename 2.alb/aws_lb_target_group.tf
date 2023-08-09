resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-048f2a5aa67d27aff"
  
      health_check {
        interval            = 15
       # path                = "/index.html"
        path                = "/index.php"
        port                = 80
        protocol            = "HTTP"
        timeout             = 5
        unhealthy_threshold = 2
        matcher             = 200
  }
}

  
