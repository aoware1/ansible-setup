resource "aws_instance" "control-server" {
  ami                         = data.aws_ami.ami.id
  instance_type               = var.instance-type
  vpc_security_group_ids      = [aws_security_group.Ansible_sg.id]
  key_name                    = aws_key_pair.instance_key.key_name
  associate_public_ip_address = true
  user_data                   = file("ansible.sh")
  tags = {
    Name = "controll-server"
  }
}
resource "aws_instance" "target1" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance-type
  vpc_security_group_ids = [aws_security_group.target_sg.id]
  key_name               = aws_key_pair.instance_key.key_name
  tags = {
    Name = "target-server1"
  }
}
resource "aws_instance" "target2" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance-type
  vpc_security_group_ids = [aws_security_group.target_sg.id]
  key_name               = aws_key_pair.instance_key.key_name
  tags = {
    Name = "target-server2"
  }
}

