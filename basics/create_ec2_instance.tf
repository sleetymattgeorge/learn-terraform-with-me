resource "aws_instance" "test"{
    ami = "xxxxxxxxxx"
    instance_type = "t2.micro"
    tags = {
        Name = "test-instance"
    }
}