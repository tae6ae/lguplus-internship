resource "aws_lb_target_group" "target_group-main" {
  name        = "tf-tg-main"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc-01.id
}

resource "aws_lb_target_group" "target_group-test" {
  name        = "tf-tg-test"
  port        = 81
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc-01.id
}