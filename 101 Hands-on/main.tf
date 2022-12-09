module "iam_module" {
  source = "./iam"
}
module "vpc_module" {
  source = "./vpc"
}
module "ec2_module" {
  source           = "./ec2"
  gateway-pub-sn   = module.vpc_module.gateway-pub-sn
  instance_profile = module.iam_module.instance_profile
  gateway-sg-id    = module.vpc_module.security-group-id
  my-gateway-vpc   = module.vpc_module.vpc_id
  depends_on       = [module.vpc_module.vpc_id]
}