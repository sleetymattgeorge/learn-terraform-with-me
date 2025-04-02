resource "aws_instance" "module2" {
    ami           = "ami-0e35ddab05955cf57"
    instance_type = "t3a.small"
    vpc_security_group_ids = [aws_security_group.sleety_sg_test.id]
    key_name = "sleety"
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                echo "sleety" > test.txt
                EOF
        tags = {
            Name = "Module2-Instance"
        }
  
}
resource "aws_security_group" "sleety_sg_test"{
    egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
  ingress                = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    }
  ]
  tags = {
    Name = "SG : sleety-test-sg"
  }
}