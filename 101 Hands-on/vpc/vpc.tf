resource "aws_vpc" "my-gateway-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames =  true
  enable_dns_support =  true
  tags = {
    Name = "my-gateway-vpc"
  }
}
resource "aws_internet_gateway" "gateway-igw" {
  vpc_id = aws_vpc.my-gateway-vpc.id
  tags = {
    Name = "gateway-igw"
  }
}

resource "aws_subnet" "gateway-pub-sn" {
  vpc_id = aws_vpc.my-gateway-vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "gateway-pub-sn"
  }
}
resource "aws_route_table" "gateway-rt" {
  vpc_id         = aws_vpc.my-gateway-vpc.id
  tags = {
    Name = "pub-rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway-igw.id
  }
}
resource "aws_route_table_association" "gateway-rt-assoc" {
  route_table_id = aws_route_table.gateway-rt.id
  subnet_id = aws_subnet.gateway-pub-sn.id
}


resource "aws_security_group" "hands-project" {
  name        = "hands-project"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my-gateway-vpc.id
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "hands-project"
  }
}
