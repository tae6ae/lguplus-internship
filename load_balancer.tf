resource "aws_lb" "lb" {
  name               = "tf-lb-nginx"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group_lb.id]
  subnets            = [aws_subnet.subnet-01.id, aws_subnet.subnet-02.id]
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group-main.arn
  }
}

resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "81"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group-test.arn
  }
}