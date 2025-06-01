# ----------------------------
# Variables générales
# ----------------------------
variable "region" {
  description = "Région AWS pour déployer l'infrastructure"
  type        = string
  default     = "eu-west-3"  # Paris
}

variable "environment" {
  description = "Environnement (dev, staging, prod)"
  type        = string
  default     = "dev"
}

# ----------------------------
# Réseau VPC et Subnets
# ----------------------------
variable "vpc_cidr" {
  description = "CIDR pour le VPC principal"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Liste des CIDR des subnets publics"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Liste des CIDR des subnets privés"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

# ----------------------------
# EKS Cluster
# ----------------------------
variable "eks_cluster_name" {
  description = "Nom du cluster EKS"
  type        = string
  default     = "parkauto-cluster"
}

# ----------------------------
# EC2 Bastion
# ----------------------------
variable "ec2_key_name" {
  description = "Nom de la paire de clés SSH pour l'instance EC2 Bastion"
  type        = string
  default     = "parkauto-key"
}

variable "bastion_allowed_cidr" {
  description = "CIDR autorisé à se connecter au Bastion (ex : IP publique de l'utilisateur)"
  type        = string
  default     = "83.202.233.67/32"  # Remplace par ton IP publique
}

# ----------------------------
# Sauvegarde S3
# ----------------------------
variable "s3_backup_bucket_name" {
  description = "Nom unique du bucket S3 pour les sauvegardes"
  type        = string
  default     = "parkauto-backup-unique-2025"  # Doit être unique globalement dans AWS
}
