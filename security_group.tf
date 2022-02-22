resource "aws_default_security_group" "security_group" {
  vpc_id = aws_vpc.vpc-01.id

  ingress {
    description = "Http Service Port & Target Group Listener Port"
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Target Group Listener Port"
    protocol  = "tcp"
    from_port = 81
    to_port   = 81
    cidr_blocks = ["172.16.0.0/16"]
  }

  ingress {
    description = "FoodTruck"
    protocol  = "tcp"
    from_port = 5000
    to_port   = 5000
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "PetClinic"
    protocol  = "tcp"
    from_port = 8080
    to_port   = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf_SC"
  }
}