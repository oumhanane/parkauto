# Région AWS utilisée
output "region" {
  description = "Région AWS utilisée pour le déploiement"
  value       = var.region
}

# ID du VPC créé
output "vpc_id" {
  description = "ID du VPC principal"
  value       = module.vpc.vpc_id
}

# Liste des subnets publics créés
output "public_subnets" {
  description = "IDs des subnets publics"
  value       = module.vpc.public_subnets
}

# Liste des subnets privés créés
output "private_subnets" {
  description = "IDs des subnets privés"
  value       = module.vpc.private_subnets
}

# Nom du cluster EKS
output "eks_cluster_name" {
  description = "Nom du cluster EKS"
  value       = aws_eks_cluster.parkauto.name
}

# Endpoint du cluster EKS
output "eks_cluster_endpoint" {
  description = "Endpoint API du cluster EKS"
  value       = aws_eks_cluster.parkauto.endpoint
}

# ARN du cluster EKS
output "eks_cluster_arn" {
  description = "ARN du cluster EKS"
  value       = aws_eks_cluster.parkauto.arn
}

# Nom du bucket S3 de sauvegarde
output "s3_backup_bucket" {
  description = "Nom du bucket S3 utilisé pour les sauvegardes"
  value       = aws_s3_bucket.parkauto_backup.bucket
}
