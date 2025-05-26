output "cluster_endpoint" {
  description = "Endpoint for your EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_id" {
  description = "EKS cluster name."
  value       = module.eks.cluster_id  
}

output "cluster_security_group_id" {
  description = "Security group ID attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}

output "cluster_arn" {
  description = "ARN of the EKS cluster."
  value       = module.eks.cluster_arn
}
