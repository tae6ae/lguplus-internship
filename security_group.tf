resource "aws_default_security_group" "security_group_service" {
  vpc_id = aws_vpc.vpc-01.id

  ingress {
    description = "Http Service Port"
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf_SC_service"
  }
}

resource "aws_security_group" "security_group_lb" {
  vpc_id = aws_vpc.vpc-01.id

  ingress {
    description = "Production Traffic Port & Target Group Listener Port"
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Test Traffic Port & Target Group Listener Port"
    protocol  = "tcp"
    from_port = 81
    to_port   = 81
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf_SC_LB"
  }
}