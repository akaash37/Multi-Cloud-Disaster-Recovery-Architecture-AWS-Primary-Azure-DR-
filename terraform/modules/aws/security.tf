resource "aws_security_group" "web_sg" {
  name        = "${var.project_name}-aws-web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.this.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-aws-web-sg"
  }
}

resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
  # public_key = file("C:/Users/user/.ssh/id_rsa.pub")

  tags = {
    Name = "${var.project_name}-aws-key"
  }
}
