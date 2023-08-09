resource "aws_lb_target_group_attachment" "test-2a" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.example-2a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "test-2c" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.example-2c.id
  port             = 80
}