terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks_infra.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_infra.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

# Gateway
resource "kubernetes_manifest" "gateway_deployment" {
  manifest   = yamldecode(file("${path.module}/k8s/gateway-deployment.yml"))
  depends_on = [module.eks_infra]
}

resource "kubernetes_manifest" "gateway_service" {
  manifest   = yamldecode(file("${path.module}/k8s/gateway-service.yml"))
  depends_on = [module.eks_infra]
}

# Client
resource "kubernetes_manifest" "client_deployment" {
  manifest   = yamldecode(file("${path.module}/k8s/client-deployment.yml"))
  depends_on = [module.eks_infra]
}

resource "kubernetes_manifest" "client_service" {
  manifest   = yamldecode(file("${path.module}/k8s/client-service.yml"))
  depends_on = [module.eks_infra]
}

# Gestion Location
resource "kubernetes_manifest" "gestionlocation_deployment" {
  manifest   = yamldecode(file("${path.module}/k8s/gestionlocation-deployment.yml"))
  depends_on = [module.eks_infra]
}

resource "kubernetes_manifest" "gestionlocation_service" {
  manifest   = yamldecode(file("${path.module}/k8s/gestionlocation-service.yml"))
  depends_on = [module.eks_infra]
}

# Gestion Véhicules
resource "kubernetes_manifest" "gestionvehicules_deployment" {
  manifest   = yamldecode(file("${path.module}/k8s/gestionvehicules-deployment.yml"))
  depends_on = [module.eks_infra]
}

resource "kubernetes_manifest" "gestionvehicules_service" {
  manifest   = yamldecode(file("${path.module}/k8s/gestionvehicules-service.yml"))
  depends_on = [module.eks_infra]
}
