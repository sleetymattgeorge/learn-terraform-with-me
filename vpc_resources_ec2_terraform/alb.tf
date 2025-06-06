resource "aws_lb" "nginx_alb" {
  name               = "sleety-nginx-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = aws_subnet.public_subnets[*].id

  tags = {
    Name = "sleety-nginx-alb"
  }
}

resource "aws_lb_target_group" "nginx_tg" {
  name     = "sleety-nginx-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "sleety-nginx-tg"
  }
}

resource "aws_lb_target_group_attachment" "nginx_attach" {
  target_group_arn = aws_lb_target_group.nginx_tg.arn
  target_id        = aws_instance.nginx.id
  port             = 80
}


resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.nginx_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx_tg.arn
  }
}

output "nginx_alb_dns" {
  value       = aws_lb.nginx_alb.dns_name
  description = "Public DNS of the ALB to access NGINX in private subnet"
}
