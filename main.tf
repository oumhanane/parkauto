terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# 1. VPC avec subnets publics/privés
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "parkauto-vpc"
  cidr = var.vpc_cidr

  azs             = ["eu-west-3a", "eu-west-3b"]
  public_subnets  = var.public_subnet_cidrs
  private_subnets = var.private_subnet_cidrs

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# 2. Bucket S3 pour backups
resource "aws_s3_bucket" "parkauto_backup" {
  bucket = var.s3_backup_bucket_name
  acl    = "private"

  tags = {
    Name        = "parkauto-backup-bucket"
    Environment = "dev"
  }
}

# Bloc séparé pour versioning (conforme aux nouvelles recommandations)
resource "aws_s3_bucket_versioning" "parkauto_backup_versioning" {
  bucket = aws_s3_bucket.parkauto_backup.id

  versioning_configuration {
    status = "Enabled"
  }
}
