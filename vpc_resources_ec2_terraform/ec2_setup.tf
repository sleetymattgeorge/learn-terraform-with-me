resource "aws_instance" "web" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t3a.small"
  vpc_security_group_ids = [aws_security_group.sleety_sg_test.id]
  subnet_id     = aws_subnet.public_subnets[0].id
  associate_public_ip_address = false
  key_name = "sleety"
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo systemctl enable apache2
              EOF
  tags = {
    Name = "terraform ec2 sleety"
  }
}

# Associate an Elastic IP with the EC2 instance
resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
  tags = {
    Name = "sleety-web-eip"
  }
}