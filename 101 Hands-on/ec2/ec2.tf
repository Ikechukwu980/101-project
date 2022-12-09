
resource "aws_instance" "webserver" {
  ami                    = "ami-0b0dcb5067f052a63"
  instance_type          = "t2.micro"
  subnet_id              = "var.gateway-pub-sn"
  vpc_security_group_ids = ["var.gateway-sg-id"]
  user_data              = file("./scripts/setup.sh")
  iam_instance_profile   = "var.instance_profile.name"
#  depends_on = [aws_security_group.hands-project]
  tags = {
    Name = "gateway-ec2"
  }
}