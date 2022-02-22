resource "aws_subnet" "subnet-01" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "172.16.0.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name = "tf_subnet-01"
  }
}

resource "aws_subnet" "subnet-02" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = "172.16.1.0/24"
  availability_zone = "us-west-1b"

  tags = {
    Name = "tf_subnet-02"
  }
}