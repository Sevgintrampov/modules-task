resource "aws_lb" "my_lb" {
  name               = "nginx-lb-${var.random_pet}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_gr]
  subnets            = [var.private_subnet, var.public_subnet]

  enable_deletion_protection = false
}
resource "aws_lb_target_group" "my_target_group" {
  name     = "nginx-tg-${var.random_pet}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_target_group_attachment" "my_target_group_attachment" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = var.instance_id
  port             = 80
}
resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}