# create default vpc if one does not exit
resource "aws_default_vpc" "default_vpc" {
}

# create security group for the Jenkins instance
resource "aws_security_group" "Ansible_sg" {
  name        = "ansible security group"
  description = "allow access on ports 8080 and 22 for jenkins and ssh"
  vpc_id      = aws_default_vpc.default_vpc.id

  # allow access on port 22 ssh connection
  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# create security group for the nexus instance
resource "aws_security_group" "target_sg" {
  name        = "target security group"
  description = "allow access on ports 8081 and 22 for nexus and ssh"
  vpc_id      = aws_default_vpc.default_vpc.id
  # allow access on port 8081 for nexus Server

  # allow access on port 22 ssh connection
  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "target security group"
  }
}

