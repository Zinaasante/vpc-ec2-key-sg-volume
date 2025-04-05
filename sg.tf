resource "aws_security_group" "web_server_sg" {
  name        = "eweb-server-sg"
  description = "allow web traffic from ssh"
  vpc_id      = aws_vpc.vpc1.id

  # Inbound rules (ingress)
  ingress {
    description = "Allow SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["154.160.1.212/32"]  # Restrict this in production!
  }

  ingress {
    description = "Allow HTTP access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules (egress)
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "web-server-security-group"

  }
  depends_on = [ aws_vpc.vpc1 ]
}