
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "my-vpc"
  }
}



resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidrs)

  vpc_id = aws_vpc.my_vpc.id

  cidr_block = var.public_subnet_cidrs[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}



resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-internet-gateway"
  }
}



resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}



resource "aws_route_table_association" "public_association" {
  count = length(var.public_subnet_cidrs)

  subnet_id = aws_subnet.public_subnet[count.index].id

  route_table_id = aws_route_table.public_rt.id
}
