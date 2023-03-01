resource "aws_subnet" "Public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.0.0/28"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Public"
  }
}

resource "aws_subnet" "Private" {
    vpc_id   = aws_vpc.main.id
  cidr_block = "192.168.0.16/28"
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Private"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "IGW"
  }
  
}


resource "aws_route_table" "VpcRT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.IGW.id
  }
  
  tags = {
  Name = "VpcRT"
  }
}

resource "aws_ec2_host" "test" {
  instance_type = "t2.micro"
  availability_zone = "eu-west-1a"
}

data "aws_ec2_host" "test" {
  host_id = aws_ec2_host.test.id
  
}