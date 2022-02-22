resource "aws_vpc" "vpc-01" {
  cidr_block = "172.16.0.0/16"

  tags = {
      Name = "tf_vpc-01"
  }
}