resource "aws_s3_bucket" "tamera1234" {
  bucket = "tamara1234"
  tags = {
    Name = "my-bucket"
    Environment = "Dev"
  }
}