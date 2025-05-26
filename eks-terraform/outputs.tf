output "cluster_endpoint" {
  value = module.eks_infra.cluster_endpoint
}

output "cluster_id" {
  value = module.eks_infra.cluster_id
}

output "cluster_security_group_id" {
  value = module.eks_infra.cluster_security_group_id
}

output "cluster_arn" {
  value = module.eks_infra.cluster_arn
}
