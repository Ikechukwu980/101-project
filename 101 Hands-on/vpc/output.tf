output "vpc_id" {
  value = aws_vpc.my-gateway-vpc.id
}

output "gateway-pub-sn" {
  value = aws_subnet.gateway-pub-sn.id
}

output "security-group-id" {
  value = aws_security_group.hands-project.id
}