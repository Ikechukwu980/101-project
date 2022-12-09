###output "ec2_iam_role_name" {
###  value = module.iam-module.ec2_iam_role_name
##}
output "vpc_id" {
  value = module.vpc_module.vpc_id
}
#output "instance_profile" {
#  value = aws_iam_instance_profile.ec2_profile
#}
output "security-group-id" {
  value = module.vpc_module.security-group-id
}


output "gateway-pub-sn" {
  value = module.vpc_module.gateway-pub-sn
}