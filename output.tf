output "anisble-server" {
  value = aws_instance.control-server.public_ip

}
output "target1" {
  value = aws_instance.target1.private_ip

}
output "target2" {
  value = aws_instance.target2.private_ip

}