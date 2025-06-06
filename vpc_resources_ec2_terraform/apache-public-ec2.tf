resource "aws_eip" "web_eip" {
  domain   = "vpc"
  instance = aws_instance.web.id
  tags = {
    Name = "sleety-web-eip"
  }
}
resource "aws_instance" "web" {
  ami                    = "ami-0e35ddab05955cf57"
  instance_type          = "t3a.small"
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  vpc_security_group_ids = [aws_security_group.sleety_sg_test.id]
  subnet_id              = aws_subnet.public_subnets[0].id
  key_name               = "sleety"
  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              systemctl start apache2
              systemctl enable apache2
              EOF
  tags = {
    Name = "sleety terraform ec2"
  }
}