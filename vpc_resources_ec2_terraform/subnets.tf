resource "aws_subnet" "public_subnets" {
  count                   = length(var.cidr_public_subnet)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.cidr_public_subnet, count.index)
  availability_zone       = element(var.ap_availability_zone, count.index)
  map_public_ip_on_launch = true
  depends_on              = [aws_vpc.main]

  tags = {
    Name = "Subnet-Public : Sleety Public Subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count             = length(var.cidr_private_subnet)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.ap_availability_zone, count.index)
  depends_on        = [aws_vpc.main]

  tags = {
    Name = "Subnet-Private : Sleety Private Subnet ${count.index + 1}"
  }
}
