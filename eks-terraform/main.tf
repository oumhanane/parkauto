module "eks_infra" {
  source = "./modules/eks-infra"
  region        = var.region
  vpc_name      = var.vpc_name
  cluster_name  = var.cluster_name
  environment   = var.environment
}
