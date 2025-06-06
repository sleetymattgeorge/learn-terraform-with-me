resource "aws_instance" "nginx" {
  ami                    = "ami-0e35ddab05955cf57"
  instance_type          = "t3a.small"
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name
  subnet_id              = aws_subnet.private_subnets[0].id
  vpc_security_group_ids = [aws_security_group.nginx_sg.id]
  key_name               = "sleety"
  user_data = <<-EOF
              #!/bin/bash
              until sudo apt update -y; do
                  echo "Waiting for network..."
                  sleep 10
              done

              until sudo apt install nginx -y; do
                  echo "Waiting for apt to be ready..."
                  sleep 10
              done

              systemctl start nginx
              systemctl enable nginx
              EOF
  tags = {
    Name = "sleety terraform nginx"
  }
}