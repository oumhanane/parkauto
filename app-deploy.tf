# provider "kubernetes" {
#  config_path = "~/.kube/config"
# }

# resource "kubernetes_manifest" "app_manifests" {
#  for_each = fileset("${path.module}/k8s/terraform", "*.yaml")

#   manifest = yamldecode(file("${path.module}/k8s/terraform/${each.key}"))
# }
